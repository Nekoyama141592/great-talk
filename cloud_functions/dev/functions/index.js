"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.verifyIOSReceipt = exports.verifyAndroidReceipt = void 0;
// 基本的な設定
const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();
const fireStore = admin.firestore();
// レシート検証(iOS)
const axios_1 = require("axios");
const RECEIPT_VERIFICATION_ENDPOINT_SANDBOX = "https://sandbox.itunes.apple.com/verifyReceipt";
const RECEIPT_VERIFICATION_ENDPOINT_FOR_IOS_PROD = "https://buy.itunes.apple.com/verifyReceipt";
const config = functions.config();
const IOS_PKG_NAME = config.appstore.ios_pkg_name;
// レシート検証(Android)
const { google } = require("googleapis");
const ANDROID_PKG_NAME = config.playstore.android_pkg_name;
// firestore
const userPath = "public/{version}/users/{uid}";
const privateUserPath = "private/{version}/privateUsers/{uid}";
const postPath = `${userPath}/posts/{postId}`;
const batchLimit = 500;
const plusOne = 1;
const minusOne = -1;
// AWS
const AWS = require('aws-sdk');
const aws_config = config.aws;
const AWS_REGION = "ap-northeast-1";

const postImagesBucket = aws_config.s3.post_images; // s3バケット
const userImagesBucket = aws_config.s3.user_images; // s3バケット

function updateAWSConfig() {
    AWS.config.update({
        accessKeyId: process.env.AWS_ACCESS_KEY,
        secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
        region: AWS_REGION,
    });
}

async function deleteFromColRef(colRef) {
    const qshot = await colRef.get();
    let count = 0;
    let batch = fireStore.batch();

    for (const doc of qshot.docs) {
        batch.delete(doc.ref);
        count++;

        if (count === batchLimit) {
            await batch.commit();
            batch = fireStore.batch();
            count = 0;
        }
    }

    if (count > 0) {
        await batch.commit();
    }
}

function saveDataToFirestore(json, path, id) {
    const db = admin.firestore();
    return db.collection(path).doc(id).set(json);
}

function mul100AndRoundingDown(num) {
    const mul100 = num * 100; // ex) 0.9988を99.88にする
    const result = Math.floor(mul100); // 数字を丸める
    return result;
}
async function saveLatestReceipt(latestReceipt,transactionID,isIos) {
    const transactionsPath = isIos ? "iosTransactions" : "androidTransactions";
    const newTransactionsPath = isIos ? "newIosTransactions" : "newAndroidTransactions";
    const oldTx = await admin.firestore().collection(transactionsPath).doc(transactionID).get();
    // 存在しないなら非同期でFirestoreに保存。
    if (!oldTx.exists) {
        saveDataToFirestore(latestReceipt, transactionsPath,transactionID);
        saveDataToFirestore(latestReceipt, newTransactionsPath,transactionID);
    }
}
async function detectDominantLanguage(text) {
    updateAWSConfig();
    const comprehend = new AWS.Comprehend({apiVersion: '2017-11-27'});
    let lCode = '';
    
    if (!text || text.trim() === "") {
        return lCode;
    }
    
    const dDparams = {
        Text: text
    };

    try {
        const dDdata = await new Promise((resolve, reject) => {
            comprehend.detectDominantLanguage(dDparams, (dDerr, dDdata) => {
                if (dDerr) {
                    reject(dDerr);
                } else {
                    resolve(dDdata);
                }
            });
        });

        lCode = dDdata.Languages[0]["LanguageCode"];
        return lCode;
    } catch (error) {
        console.log(error);
        return lCode;
    }
}

async function detectText(text) {
    updateAWSConfig();
    const comprehend = new AWS.Comprehend({apiVersion: '2017-11-27'});
    let detectedText = {
        "languageCode": "",
        "negativeScore": 0.0,
        "positiveScore": 0.0,
        "sentiment": "",
        "value": text,
    };

    if (!text || text.trim() === "") {
        return detectedText;
    }

    try {
        const lCode = await detectDominantLanguage(text);
        if (lCode) {
            const dSparams = {
                LanguageCode: lCode,
                Text: text,
            };

            const dSdata = await new Promise((resolve, reject) => {
                comprehend.detectSentiment(dSparams, (dSerr, dSdata) => {
                    if (dSerr) {
                        reject(dSerr);
                    } else {
                        resolve(dSdata);
                    }
                });
            });

            detectedText = {
                "languageCode": lCode,
                "negativeScore": mul100AndRoundingDown(dSdata.SentimentScore.Negative),
                "positiveScore": mul100AndRoundingDown(dSdata.SentimentScore.Positive),
                "sentiment": dSdata.Sentiment,
                "value": text,
            };
        }

        return detectedText;
    } catch (error) {
        console.log(error);
        return detectedText;
    }
}
async function detectModerationLabels(bucketName, fileName) {
    updateAWSConfig();
    const rekognition = new AWS.Rekognition();
    let detectedImage = {
        "bucketName": bucketName,
        "moderationLabels": [],
        "moderationModelVersion": '',
        "value": fileName,
    };

    if (!bucketName || bucketName.trim() === "" || !fileName || fileName.trim() === "") {
        return detectedImage;
    }

    try {
        const params = {
            Image: {
                S3Object: {
                    Bucket: bucketName,
                    Name: fileName,
                },
            },
            MinConfidence: 60,
        };

        const moderationLabelsResponse = await rekognition.detectModerationLabels(params).promise();

        detectedImage = {
            "bucketName": bucketName,
            "moderationLabels": moderationLabelsResponse.ModerationLabels,
            "moderationModelVersion": moderationLabelsResponse.ModerationModelVersion,
            "value": fileName,
        };
    } catch (error) {
        console.error('Error:', error);
    }

    return detectedImage;
}
function getPrivateKey(privateKey) {
    const key  = chunkSplit(privateKey, 64, '\n');
    const pkey = '-----BEGIN PRIVATE KEY-----\n' + key + '-----END PRIVATE KEY-----\n';

    return pkey;
  }
  
  function getPublicKey(publicKey) {
    const key = chunkSplit(publicKey, 64, '\n');
    const pkey = '-----BEGIN PUBLIC KEY-----\n' + key + '-----END PUBLIC KEY-----\n';
  
    return pkey;
  }
  
  function chunkSplit(str, len, end) {
    const match = str.match(new RegExp('.{0,' + len + '}', 'g'));
    if (!match) {
      return '';
    }
  
    return match.join(end);
  }

exports.onFollowerCreate = functions.firestore.document(`${userPath}/followers/{followerUid}`).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.activeUserRef.update({
            'followingCount': admin.firestore.FieldValue.increment(plusOne),
        });
        await newValue.passiveUserRef.update({
            'followerCount': admin.firestore.FieldValue.increment(plusOne),
        });
    }
);

exports.onFollowerDelete = functions.firestore.document(`${userPath}/followers/{followerUid}`).onDelete(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.activeUserRef.update({
            'followingCount': admin.firestore.FieldValue.increment(minusOne),
        });
        await newValue.passiveUserRef.update({
            'followerCount': admin.firestore.FieldValue.increment(minusOne),
        });
    }
);
exports.onPostCreate = functions
.runWith({secrets: ["AWS_ACCESS_KEY","AWS_SECRET_ACCESS_KEY"]})
.firestore.document(postPath).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
        const detectedDescription = await detectText(newValue.description.value);
        const detectedTitle = await detectText(newValue.title.value);
        const detectedImage = await detectModerationLabels(postImagesBucket,newValue.image.value);
        await snap.ref.update({
            'description': detectedDescription,
            'title': detectedTitle,
            'image': detectedImage,
        });
        // timelineを作成
        const timeline = {
            "createdAt": newValue.createdAt,
            "isRead": false,
            "posterUid": newValue.poster.uid,
            "postId": newValue.postId,
        };
        const posterRef = newValue.poster.ref;
        await posterRef.collection('timelines').doc(newValue.postId).set(timeline); // 投稿者にもSet
        // followersをget
        const followers = await posterRef.collection("followers").get();
        let count = 0;
        let batch = fireStore.batch();
        for (const follower of followers.docs) {
            const data = follower.data();
            // followerのtimelineを作成
            const ref = data.activeUserRef.collection("timelines").doc(newValue.postId);
            batch.set(ref,timeline);
            count++;
            if (count == batchLimit) {
                await batch.commit();
                batch = fireStore.batch();
                count = 0;
            }
        }
        if (count > 0) {
            await batch.commit();
        }
    }
);
exports.onPostLikeCreate = functions.firestore.document(`${postPath}/postLikes/{activeUid}`).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.postRef.update({
            "likeCount": admin.firestore.FieldValue.increment(plusOne),
        });
    }
);

exports.onPostLikeDelete = functions.firestore.document(`${postPath}/postLikes/{activeUid}`).onDelete(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.postRef.update({
            "likeCount": admin.firestore.FieldValue.increment(minusOne),
        });
    }
);
exports.onPostMessageCreate = functions.firestore.document(`${postPath}/senders/{senderUid}/messages/{activeUid}`).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.postRef.update({
            "msgCount": admin.firestore.FieldValue.increment(plusOne),
        });
    }
);


exports.onPostMuteCreate = functions.firestore.document(`${postPath}/postMutes/{activeUid}`).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.postRef.update({
            "muteCount": admin.firestore.FieldValue.increment(plusOne),
        });
    }
);

exports.onPostMuteDelete = functions.firestore.document(`${postPath}/postMutes/{activeUid}`).onDelete(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.postRef.update({
            "muteCount": admin.firestore.FieldValue.increment(minusOne),
        });
    }
);
exports.onPostReportCreate = functions.firestore.document(`${postPath}/postReports/{postReport}`).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.postRef.update({
            "reportCount": admin.firestore.FieldValue.increment(plusOne),
        });
    }
);
exports.onUserDelete = functions.firestore.document(userPath).onDelete(
    async (snap,_) => {
        const uid = snap.id;
        const myRef = snap.ref;
        // 自分をPostを消す
        await deleteFromColRef(myRef.collection('posts'));
        // 自分のtimelineを消す
        await deleteFromColRef(myRef.collection('timelines'));
        // 自分のuserUpdateLogsを消す
        await deleteFromColRef(myRef.collection('userUpdateLogs'));
        // privateUserを削除
        await fireStore.collection('private').doc('v1').collection('privateUsers').doc(uid).delete();
    }
);
exports.onPrivateUserDelete = functions.firestore.document(privateUserPath).onDelete(
    async (snap,_) => {
        const myRef = snap.ref;
        // 自分のtokenを消す
        await deleteFromColRef(myRef.collection('tokens'));
    }
);
exports.onBookmarkCategoryDelete = functions.firestore.document(`${privateUserPath}/bookmarkCategories/{categoryId}`).onDelete(
    async (snap,_) => {
        const ref = snap.ref;
        // カテゴリー下のブックマークを全て削除
        await deleteFromColRef(ref.collection('bookmarks'));
    }
);
exports.onUserMutesCreate = functions.firestore.document(`${userPath}/userMutes/{activeUid}`).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.passiveUserRef.update({
            'muteCount': admin.firestore.FieldValue.increment(plusOne),
        });
    }
);

exports.onUserMutesDelete = functions.firestore.document(`${userPath}/userMutes/{activeUid}`).onDelete(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.passiveUserRef.update({
            'muteCount': admin.firestore.FieldValue.increment(minusOne),
        });
    }
);
exports.onUserUpdateLogCreate = functions
.runWith({secrets: ["AWS_ACCESS_KEY","AWS_SECRET_ACCESS_KEY"]})
.firestore.document(`${userPath}/userUpdateLogs/{id}`).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
        const userRef = newValue.userRef;
        const detectedUserName = await detectText(newValue.stringUserName);
        const detectedBio = await detectText(newValue.stringBio);
        const detectedImage = await detectModerationLabels(userImagesBucket,newValue.imageFileName);
        await userRef.update({
            'bio': detectedBio,
            'image': detectedImage,
            'searchToken': newValue.searchToken,
            'userName': detectedUserName,
        });
        const user = await userRef.get();
        const posts = await userRef.collection('posts').get();
        let postCount = 0;
        let postBatch = fireStore.batch();
        for (const post of posts.docs) {
            postBatch.update(post.ref,{
                "poster": user.data(),
            })
            postCount++;
            if (postCount == batchLimit) {
                await postBatch.commit();
                postBatch = fireStore.batch();
                postCount = 0;
            }
        }
        if (postCount > 0) {
            await postBatch.commit();
        }
    }
);
exports.verifyAndroidReceipt = functions
.runWith({secrets: ["GCP_PRIVATE_KEY"]})
.https.onRequest(async (req, res) => {
    if (req.method !== "POST") {
        res.status(403).send();
        return;
    }
    const json = req.body.data;
    const privateKey = getPrivateKey(process.env.GCP_PRIVATE_KEY);
    const authClient = new google.auth.JWT({
        email: config.gcp.client_email,
        key: privateKey,
        scopes: ["https://www.googleapis.com/auth/androidpublisher"],
    });
    const playDeveloperApiClient = google.androidpublisher({
        version: "v3",
        auth: authClient,
    });
    const receipt = json.verificationData.localVerificationData;
    const decodedReceipt = JSON.parse(receipt);
    const typeOfSubscription = decodedReceipt["autoRenewing"];
    const productId = decodedReceipt["productId"];
    // decode
    let response;
    if (typeOfSubscription) {
        // サブスクアイテム
        try {
            response = await playDeveloperApiClient.purchases.subscriptions.get({
                packageName: ANDROID_PKG_NAME,
                subscriptionId: productId,
                token: decodedReceipt["purchaseToken"],
            });
        } catch(error) {
            res.status(403).send();
            return;
        }

        let latestReceipt = response.data;
        if (!latestReceipt || response.status !== 200) {
            res.status(403).send();
            return;
        }
        // 期限内であることを確認する
        const now = Date.now();
        const expireDate = Number(latestReceipt["expiryTimeMillis"]);
        if (now < expireDate) {
            latestReceipt["productId"] = productId;
            const transactionID = latestReceipt['orderId'].replace("GPA.", "");
            await saveLatestReceipt(latestReceipt,transactionID,false); // awaitを使用しないと保存されない
            res.status(200).send({ latestReceipt: latestReceipt,});
            return;
        } else {
            res.status(403).send();
            return;
        }
    }
});
// ios
exports.verifyIOSReceipt = functions
.runWith({secrets: ["APP_SHARED_SECRET"]})
.https.onRequest(async (req, res) => {
    const RECEIPT_VERIFICATION_PASSWORD_FOR_IOS = process.env.APP_SHARED_SECRET;
    if (req.method !== "POST") {
        res.status(403).send();
        return;
    }
    const verificationData = req.body.data;
    if (!verificationData) {
        res.status(403).send();
        return;
    }
    let response;
    try {
        response = await axios_1.default.post(RECEIPT_VERIFICATION_ENDPOINT_FOR_IOS_PROD, {
            "receipt-data": verificationData,
            "password": RECEIPT_VERIFICATION_PASSWORD_FOR_IOS,
            "exclude-old-transactions": true,
        });
        if (response.data && response.data["status"] === 21007) {
            response = await axios_1.default.post(RECEIPT_VERIFICATION_ENDPOINT_SANDBOX, {
                "receipt-data": verificationData,
                "password": RECEIPT_VERIFICATION_PASSWORD_FOR_IOS,
                "exclude-old-transactions": true,
            });
        }
    } catch(err) {
        res.status(400).send();
        return;
    }
    const result = response.data;
    if (result["status"] !== 0) {
        res.status(403).send();
        return;
    }
    if (!result["receipt"] || result["receipt"]["bundle_id"] !== IOS_PKG_NAME) {
        res.status(403).send();
        return;
    }
    const latestReceipt = result["latest_receipt_info"][0];
    if (latestReceipt === null || latestReceipt === undefined) {
        res.status(403).send();
        return;
    }
    // 期限内であることを確認する
    const now = Date.now();
    const expireDate = Number(latestReceipt["expires_date_ms"]);
    if (now < expireDate) {
        const transactionID = latestReceipt["transaction_id"];
        await saveLatestReceipt(latestReceipt,transactionID,true); // awaitを使用しないと保存されない
        res.status(200).send({ latestReceipt: latestReceipt,});
        return;
    } else {
        res.status(403).send();
        return;
    }
});