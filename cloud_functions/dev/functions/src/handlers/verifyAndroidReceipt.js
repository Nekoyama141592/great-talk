// 基本的な設定
const functions = require("firebase-functions");
// レシート検証(Android)
const { google } = require("googleapis");
const ANDROID_PKG_NAME = `${process.env.ANDROID_PKG_NAME}`;
// utils
const { isValidAuth } = require('../utils/isValidAuth');
const { getPrivateKey } = require('../utils/getPrivateKey');
const { saveLatestReceipt } = require('../utils/saveLatestReceipt');
exports.verifyAndroidReceipt = functions
.https.onRequest(async (req, res) => {
    if (req.method !== "POST" || !isValidAuth(req.headers.authorization)) {
        res.status(403).send();
        return;
    }
    const purchaseDetails = req.body["data"];
    const privateKey = getPrivateKey(`${process.env.GCP_PRIVATE_KEY}`);
    const authClient = new google.auth.JWT({
        email: config.gcp.client_email,
        key: privateKey,
        scopes: ["https://www.googleapis.com/auth/androidpublisher"],
    });
    const playDeveloperApiClient = google.androidpublisher({
        version: "v3",
        auth: authClient,
    });
    const receipt = purchaseDetails.verificationData.localVerificationData;
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
            const transactionID = latestReceipt['orderId'];
            const uid = req.body["uid"];
            latestReceipt["uid"] = uid;
            latestReceipt["productId"] = productId;
            await saveLatestReceipt(latestReceipt,uid,transactionID,false); // awaitを使用しないと保存されない
            res.status(200).send({ latestReceipt: latestReceipt,});
            return;
        } else {
            res.status(403).send();
            return;
        }
    }
});