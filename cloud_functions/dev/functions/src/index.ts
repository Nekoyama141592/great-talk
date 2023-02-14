import * as functions from "firebase-functions";
import * as crypto from "crypto";
import {google} from "googleapis";
import axios from "axios";

const RECEIPT_VERIFICATION_ENDPOINT_SANDBOX = "https://sandbox.itunes.apple.com/verifyReceipt";
const RECEIPT_VERIFICATION_ENDPOINT_FOR_IOS_PROD = "https://buy.itunes.apple.com/verifyReceipt";
const RECEIPT_VERIFICATION_PASSWORD_FOR_IOS = functions
    .config()
    .appstoreconnect
    .app_shared_secret;

const IOS_PKG_NAME = "com.firebaseapp.greatTalk";
const ANDROID_PACKAGE_NAME = "com.firebaseapp.great_talk";
const fHttps = functions.https;
const authClient = new google.auth.JWT({
  email: functions.config().gcp.client_email,
  key: getPrivateKey(functions.config().gcp.private_key),
  scopes: ["https://www.googleapis.com/auth/androidpublisher"],
});
const playDeveloperApiClient = google.androidpublisher({
  version: "v3",
  auth: authClient,
});
import * as admin from 'firebase-admin';
admin.initializeApp();

/**
@function getPrivateKey
@param {string} privateKey - The private key to format.
@return {string} - The formatted private key.
*/
function getPrivateKey(privateKey: string): string {
  const key = chunkSplit(privateKey, 64, "\n");
  const bPriK = "-----BEGIN PRIVATE KEY-----\n";
  const ePriK = "-----END PRIVATE KEY-----\n";
  const pkey = bPriK + key + ePriK;
  return pkey;
}
/**

@function getPublicKey
@param {string} publicKey - The public key to format.
@return {string} - The formatted public key.
*/
function getPublicKey(publicKey: string): string {
  const key = chunkSplit(publicKey, 64, "\n");
  const bPubK = "-----BEGIN PUBLIC KEY-----\n";
  const ePubK = "-----END PUBLIC KEY-----\n";
  const pkey = bPubK + key + ePubK;
  return pkey;
}
/**

@function chunkSplit
@param {string} str - The string to split.
@param {number} len - The length of each chunk.
@param {string} end - The end character to add between each chunk.
@return {string} - The chunk-split string.
*/
function chunkSplit(str: string, len: number, end: string): string {
  const match = str.match(new RegExp(".{0," + len + "}", "g"));
  if (!match) {
    return "";
  }
  return match.join(end);
}

export const verifyAndroidReceipt = fHttps.onRequest(async (req, res) => {
  if (req.method !== "POST") {
    res.status(403).send();
    return;
  }
  const body = JSON.parse(req.body);
  const signature = body.signature;
  const receipt = body.receipt;
  const validator = crypto.createVerify("SHA1");
  validator.update(receipt);
  let validity = false;
  try {
    validity = validator.verify(
        getPublicKey(functions.config().gcp.google_play_store_public_key),
        signature,
        "base64"
    );
  } catch (error) {
    res.status(500).send();
    return;
  }
  if (!validity) {
    res.status(403).send();
    return;
  }

  const decodedReceipt = JSON.parse(receipt);
  // await saveAndroidReceipt(decodedReceipt);

  const typeOfSubscription = decodedReceipt["autoRenewing"];
  if (typeOfSubscription) {
    const response = await playDeveloperApiClient.purchases.subscriptions.get({
      packageName: ANDROID_PACKAGE_NAME,
      subscriptionId: decodedReceipt["productId"],
      token: decodedReceipt["purchaseToken"],
    });

    const subscriptions = response.data;
    if (subscriptions && subscriptions["expiryTimeMillis"]) {
      if (+subscriptions["expiryTimeMillis"] <= Date.now()) {
        res.status(403).send();
        return;
      }
    }

    if (!subscriptions || response.status !== 200) {
      res.status(403).send();
      return;
    }

    // await saveAndroidSubscriptionData(subscriptions);
  } else {
    const purchases = playDeveloperApiClient.purchases;
    const response = await purchases.voidedpurchases.list({
      packageName: ANDROID_PACKAGE_NAME,
    });

    const voidedPurchases = response.data;
    if (voidedPurchases && Array.isArray(voidedPurchases["voidedPurchases"])) {
      const voidedTokens = voidedPurchases["voidedPurchases"].map(
          (purchase: any) => purchase["purchaseToken"]
      );
      if (voidedTokens.includes(decodedReceipt["purchaseToken"])) {
        res.status(403).send();
        return;
      }
    }
  }
});

export const verifyIOSReceipt = functions.https.onRequest(async (req, res) => {
  if (req.method !== "POST") {
    res.status(403).send();
    return;
  }
  const body = JSON.parse(req.body);
  const verificationData = body.data;
  if (!verificationData) {
    res.status(403).send();
    return;
  }
  let response;
  try {
    response = await axios.post(RECEIPT_VERIFICATION_ENDPOINT_FOR_IOS_PROD, {
      "receipt-data": verificationData,
      "password": RECEIPT_VERIFICATION_PASSWORD_FOR_IOS,
      "exclude-old-transactions": true,
    });
    if (response.data && response.data["status"] === 21007) {
      response = await axios.post(RECEIPT_VERIFICATION_ENDPOINT_SANDBOX, {
        "receipt-data": verificationData,
        "password": RECEIPT_VERIFICATION_PASSWORD_FOR_IOS,
        "exclude-old-transactions": true,
      });
    }
  } catch (e) {
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
  const receiptCollections: Array<object> = result["latest_receipt_info"];
  // for (let transaction of receiptCollections) {
  //     await saveTransactionIOs(transaction);
  // }
  res.status(200).send(JSON.stringify({
    essage: "Receipt registration successful.",
    transactions: receiptCollections,
  }));
});
