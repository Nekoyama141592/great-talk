"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.verifyIOSReceipt = exports.verifyAndroidReceipt = void 0;
// firestore
const functions = require("firebase-functions");
const admin = require("firebase-admin");
const config = functions.config();
admin.initializeApp();
const fHttps = functions.https;
const userPath = "public/{version}/users/{uid}";
const postPath = `${userPath}/public/{version}/posts/{postId}`;
// reciept
const axios_1 = require("axios");
const RECEIPT_VERIFICATION_ENDPOINT_SANDBOX = "https://sandbox.itunes.apple.com/verifyReceipt";
const RECEIPT_VERIFICATION_ENDPOINT_FOR_IOS_PROD = "https://buy.itunes.apple.com/verifyReceipt";
const appStoreConfig = config.appstore;
const IOS_PKG_NAME = appStoreConfig.ios_pkg_name;
// AWS
const AWS = require('aws-sdk');
const aws_config = config.aws;
const AWS_ACCESS_KEY = aws_config.access_key;
const AWS_SECRET_ACCESS_KEY = aws_config.secret_access_key;
const AWS_REGION = aws_config.region;
// IAM設定
AWS.config.update({
    accessKeyId: AWS_ACCESS_KEY,
    secretAccessKey: AWS_SECRET_ACCESS_KEY,
    region: AWS_REGION,
});
const comprehend = new AWS.Comprehend({apiVersion: '2017-11-27'});
const rekognition = new AWS.Rekognition();
const postImagesBucket = aws_config.s3.post_images; // s3バケット

function saveDataToFirestore(json, path,id) {
    const db = admin.firestore();
    return db.collection(path).doc(id).set(json);
}
function getDataFromFirestore(path,id) {
    const db = admin.firestore();
    return db.collection(path).doc(id).get();
}
function mul100AndRoundingDown(num) {
    const mul100 = num * 100; // ex) 0.9988を99.88にする
    const result = Math.floor(mul100); // 数字を丸める
    return result;
}
  
async function detectDominantLanguage(text) {
    let lCode = '';
    if (!text || text.trim() === "") {
        return lCode;
    }
    const dDparams = {
        Text: text
    };
    comprehend.detectDominantLanguage(
        dDparams,
        async (dDerr,dDdata) => {
            if (dDerr) {
                console.log(dDerr); // もし、エラーがあれば
            } else {
                lCode = dDdata.Languages[0]["LanguageCode"]; // 一番確率の高いLanguageCode
            }
        }
    );
    return lCode;
}
async function detectText(text) {
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
    const lCode = await detectDominantLanguage(text);
    if (lCode) {
        // lCodeが空欄でなければ
        const dSparams = {
            LanguageCode: lCode,
            Text: text,
        };
        comprehend.detectSentiment(
            dSparams,
            async (dSerr, dSdata) => {
                if (dSerr) {
                    console.log(dSerr);
                } else {
                    detectedText = {
                        "languageCode": lCode,
                        "negativeScore": mul100AndRoundingDown(dSdata.SentimentScore.Negative),
                        "positiveScore": mul100AndRoundingDown(dSdata.SentimentScore.Positive),
                        "sentiment": dSdata.Sentiment,
                        "value": text,
                    };
                }
            }
        );
    }
    return detectedText;
}
async function detectModerationLabels(fileName) {
    let detectedImage = {
        "moderationLabels": [],
        "moderationModelVersion": '',
        "value": fileName,
    };
    if (!text || text.trim() === "") {
        return detectedImage;
    }
    try {
      const params = {
        Image: {
          S3Object: {
            Bucket: postImagesBucket,
            Name: fileName,
          },
        },
      };
      const moderationLabelsResponse = await rekognition.detectModerationLabels(params).promise();
      detectedImage = {
          "moderationLabels": moderationLabelsResponse.ModerationLabels,
          "moderationModelVersion": moderationLabelsResponse.moderationModelVersion,
          "value": fileName,
      };
    } catch (error) {
      console.error('Error:', error);
    }
    return detectedImage;
  }

exports.onUserDelete = functions.firestore.document(userPath).onDelete(
    async (snap,_) => {
        const newValue = snap.data();
        // TODO: 投稿を削除
    }
);
exports.onFollowerCreate = functions.firestore.document(`${userPath}/followers/{followerUid}`).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.activeUserRef.update({
            'followerCount': admin.firestore.FieldValue.increment(plusOne),
        });
        await newValue.passiveUserRef.update({
            'followingCount': admin.firestore.FieldValue.increment(plusOne),
        });
    }
);

exports.onFollowerDelete = functions.firestore.document(`${userPath}/followers/{followerUid}`).onDelete(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.activeUserRef.update({
            'followerCount': admin.firestore.FieldValue.increment(minusOne),
        });
        await newValue.passiveUserRef.update({
            'followingCount': admin.firestore.FieldValue.increment(minusOne),
        });
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

exports.onUserMutesDelete = functions.firestore.document(`${userPath}/UserMutes/{activeUid}`).onDelete(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.passiveUserRef.update({
            'muteCount': admin.firestore.FieldValue.increment(minusOne),
        });
    }
);

exports.onUserUpdateLogCreate = functions.firestore.document(`${userPath}/userUpdateLogs/{id}`).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
        const detectedUserName = await detectText(newValue.stringUserName);
        const detectedBio = await detectText(newValue.stringBio);
        const detectedImage = await detectModerationLabels(newValue.userImageFileName);
        await newValue.userRef.update({
            'bio': detectedBio,
            'userName': detectedUserName,
            'userImage': detectedImage,
        });
        // TODO: 投稿のuserを全てUpdate
    }
);

exports.onPostCreate = functions.firestore.document(postPath).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
        const detectedDescription = await detectText(newValue.description['value']);
        const detectedTitle = await detectText(newValue.title['value']);
        const detectedIconImage = await detectModerationLabels(newValue.iconImage['value']);
        await snap.ref.update({
            'description': detectedDescription,
            'title': detectedTitle,
            'iconImage': detectedIconImage,
        });
        // TODO: タイムラインの作成
    }
);
exports.onPostLikeCreate = functions.firestore.document(`${postPath}/{postId}/postLikes/{activeUid}`).onCreate(
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

exports.verifyAndroidReceipt = fHttps.onRequest(async (req, res) => {
    if (req.method !== "POST") {
        res.status(200).send({
            responseCode: 403,
            message: "POSTリクエストではありません！！",
        });
        return;
    }
    const json = req.body.data;
    res.status(200).send({
        responseCode: 200,
        message: "Receipt Android verification successfully.",
    });
    const docID = json["purchaseID"].replace("GPA.", "");
    const oldTx = await getDataFromFirestore("androidPurchases",docID);
    // 存在しないならFirestoreに保存
    if (!oldTx.exists) {
        saveDataToFirestore(json,"androidPurchases",docID);
        saveDataToFirestore(json,"newAndroidPurchases",docID);
    }
    return;
});
exports.verifyIOSReceipt = functions
.runWith({secrets: ["APP_SHARED_SECRET"],})
.https.onRequest(async (req, res) => {
    const RECEIPT_VERIFICATION_PASSWORD_FOR_IOS = process.env.APP_SHARED_SECRET;
    if (req.method !== "POST") {
        res.status(200).send({
            responseCode: 403,
            message: "POSTリクエストではありません！！",
        });
        return;
    }
    const verificationData = req.body.data;
    if (!verificationData) {
        res.status(200).send({
            responseCode: 403,
            message: "verificationDataがありません",
        });
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
        res.status(200).send({
            responseCode: 400,
            message: "axiosのリクエストが失敗しました",
        });
        return;
    }
    const result = response.data;
    if (result["status"] !== 0) {
        res.status(200).send({
            responseCode: 403,
            message: `statusが0ではありません.${JSON.stringify(response.data)}`,
        });
        return;
    }
    if (!result["receipt"] || result["receipt"]["bundle_id"] !== IOS_PKG_NAME) {
        res.status(200).send({
            responseCode: 403,
            message: "正しいレシートではありません",
        });
        return;
    }
    const latestReceipt = result["latest_receipt_info"][0];
      if (latestReceipt === null || latestReceipt === undefined) {
        res.status(200).send({
            responseCode: 403,
            message: "最新のレシートが存在しません",
        });
      }
      const transactionID = latestReceipt["transaction_id"];
      const oldTx = await getDataFromFirestore("iosTransactions",transactionID);
      // 存在しないならFirestoreに保存。
      if (!oldTx.exists) {
        await saveDataToFirestore(latestReceipt, "iosTransactions",transactionID);
        await saveDataToFirestore(latestReceipt, "newIosTransactions",transactionID);
      }
      // 期限内であることを確認する
      const now = Date.now();
      const expireDate = Number(latestReceipt["expires_date_ms"]);
      if (now < expireDate) {
        res.status(200).send({
            responseCode: 200,
            message: "レシートの検証に成功しました",
        });
        return;
      } else {
        res.status(200).send({
            responseCode: 403,
            message: "期限が切れています",
        });
      }
});