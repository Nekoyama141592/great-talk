// 基本的な設定
const functions = require("firebase-functions");
const admin = require("firebase-admin");

// firestore
const userPath = "public/{version}/users/{uid}";
const minusOne = -1;

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