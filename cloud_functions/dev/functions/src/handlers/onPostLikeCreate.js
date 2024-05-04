// 基本的な設定
const functions = require("firebase-functions");
const admin = require("firebase-admin");
// firestore
const userPath = "public/{version}/users/{uid}";
const postPath = `${userPath}/posts/{postId}`;
const plusOne = 1;

exports.onPostLikeCreate = functions.firestore.document(`${postPath}/postLikes/{activeUid}`).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.postRef.update({
            "likeCount": admin.firestore.FieldValue.increment(plusOne),
        });
    }
);