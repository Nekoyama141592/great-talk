// 基本的な設定
const functions = require("firebase-functions");
const IOS_PKG_NAME = `${process.env.IOS_PKG_NAME}`;
// レシート検証(iOS)
const axios_1 = require("axios");
const RECEIPT_VERIFICATION_ENDPOINT_SANDBOX = "https://sandbox.itunes.apple.com/verifyReceipt";
const RECEIPT_VERIFICATION_ENDPOINT_FOR_IOS_PROD = "https://buy.itunes.apple.com/verifyReceipt";
// utils
const { isValidAuth } = require('../utils/isValidAuth');
const { saveLatestReceipt } = require('../utils/saveLatestReceipt');

exports.verifyIOSReceipt = functions
.https.onRequest(async (req, res) => {
    if (req.method !== "POST" || !isValidAuth(req.headers.authorization)) {
        res.status(403).send();
        return;
    }
    const purchaseDetails = req.body["data"];
    const verificationData = purchaseDetails.verificationData.serverVerificationData;
    if (!verificationData) {
        res.status(403).send();
        return;
    }
    let response;
    const RECEIPT_VERIFICATION_PASSWORD_FOR_IOS = `${process.env.APP_SHARED_SECRET}`;
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
    let latestReceipt = result["latest_receipt_info"][0];
    if (latestReceipt === null || latestReceipt === undefined) {
        res.status(403).send();
        return;
    }
    // 期限内であることを確認する
    const now = Date.now();
    const expireDate = Number(latestReceipt["expires_date_ms"]);
    if (now < expireDate) {
        const transactionID = latestReceipt["transaction_id"];
        const uid = req.body["uid"];
        latestReceipt["uid"] = uid;
        await saveLatestReceipt(latestReceipt,uid,transactionID,true); // awaitを使用しないと保存されない
        res.status(200).send({ latestReceipt: latestReceipt });
        return;
    } else {
        res.status(403).send();
        return;
    }
});