// 基本的な設定
const functions = require("firebase-functions");
const admin = require("firebase-admin");
const db = admin.firestore();

// firestore
const userPath = "public/{version}/users/{uid}";
// utils
const { deleteFromColRef } = require('../utils/deleteFromColRef');

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
        await db.collection('private').doc('v1').collection('privateUsers').doc(uid).delete();
    }
);