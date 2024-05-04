// 基本的な設定
const functions = require("firebase-functions");
const admin = require("firebase-admin");

// firestore
const userPath = "public/{version}/users/{uid}";
const privateUserPath = "private/{version}/privateUsers/{uid}";
// utils
const { deleteFromColRef } = require('../utils/deleteFromColRef');

exports.onPrivateUserDelete = functions.firestore.document(privateUserPath).onDelete(
    async (snap,_) => {
        const myRef = snap.ref;
        // 自分のtokenを消す
        await deleteFromColRef(myRef.collection('tokens'));
    }
);