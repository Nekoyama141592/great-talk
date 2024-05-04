// 基本的な設定
const admin = require("firebase-admin");
const db = admin.firestore();

// firestore
const batchLimit = 500;

async function deleteFromColRef(colRef) {
    const qshot = await colRef.get();
    let count = 0;
    let batch = db.batch();

    for (const doc of qshot.docs) {
        batch.delete(doc.ref);
        count++;

        if (count === batchLimit) {
            await batch.commit();
            batch = db.batch();
            count = 0;
        }
    }

    if (count > 0) {
        await batch.commit();
    }
}
module.exports = {
    deleteFromColRef
};