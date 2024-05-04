// 基本的な設定
const admin = require("firebase-admin");
const db = admin.firestore();
const { saveDataToFirestore } = require('./saveDataToFirestore');
async function saveLatestReceipt(latestReceipt,uid,transactionID,isIos) {
    const transactionsPath = isIos ? "iosTransactions" : "androidTransactions";
    const transactionColRef = db.collection('private').doc('v1').collection('privateUsers').doc(uid).collection(transactionsPath);
    const newTransactionsPath = isIos ? "newIosTransactions" : "newAndroidTransactions";
    const newTransactionsColRef = db.collection(newTransactionsPath);
    const oldTx = await transactionColRef.doc(transactionID).get();
    // 存在しないなら非同期でFirestoreに保存。
    if (!oldTx.exists) {
        saveDataToFirestore(latestReceipt, transactionColRef,transactionID);
        saveDataToFirestore(latestReceipt, newTransactionsColRef,transactionID);
    }
}
module.exports = {
    saveLatestReceipt
};