"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.verifyIOSReceipt = exports.verifyAndroidReceipt = void 0;
// firestore
const functions = require("firebase-functions");
const admin = require("firebase-admin");
const config = functions.config();
admin.initializeApp();
const fHttps = functions.https;
const userPath = "${userRef}";
const postPath = `${userPath}/public/{version}/posts/{postId}`;
// reciept
const axios_1 = require("axios");
const RECEIPT_VERIFICATION_ENDPOINT_SANDBOX = "https://sandbox.itunes.apple.com/verifyReceipt";
const RECEIPT_VERIFICATION_ENDPOINT_FOR_IOS_PROD = "https://buy.itunes.apple.com/verifyReceipt";
const appStoreConfig = config.appstore;
const IOS_PKG_NAME = appStoreConfig.ios_pkg_name;

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
function detectDominantLanguage(text) {
    return '';
}
function detectText(text,languageCode) {
    return {};
}
function detectImage(fileName) {
    return {};
}

exports.onUserCreate = functions.firestore.document(userPath).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
    }
);
exports.onUserDelete = functions.firestore.document(userPath).onDelete(
    async (snap,_) => {
        const newValue = snap.data();
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

exports.onUserMutesCreate = functions.firestore.document(`${userPath}/userUpdateLog/{id}`).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
    }
);
exports.onPostCreate = functions.firestore.document(postPath).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
    }
);
exports.onPostDelete = functions.firestore.document(postPath).onDelete(
    async (snap,_) => {
        const newValue = snap.data();
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