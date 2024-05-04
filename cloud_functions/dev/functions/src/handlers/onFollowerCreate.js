// 基本的な設定
const functions = require("firebase-functions");
const admin = require("firebase-admin");
// firestore
const userPath = "public/{version}/users/{uid}";
const plusOne = 1;
exports.onFollowerCreate = functions.firestore.document(`${userPath}/followers/{followerUid}`).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.activeUserRef.update({
            'followingCount': admin.firestore.FieldValue.increment(plusOne),
        });
        await newValue.passiveUserRef.update({
            'followerCount': admin.firestore.FieldValue.increment(plusOne),
        });
    }
);