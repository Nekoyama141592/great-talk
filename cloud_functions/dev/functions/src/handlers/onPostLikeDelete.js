// 基本的な設定
const functions = require("firebase-functions");
const admin = require("firebase-admin");

// firestore
const userPath = "public/{version}/users/{uid}";
const postPath = `${userPath}/posts/{postId}`;
const minusOne = -1;

exports.onPostLikeDelete = functions.firestore.document(`${postPath}/postLikes/{activeUid}`).onDelete(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.postRef.update({
            "likeCount": admin.firestore.FieldValue.increment(minusOne),
        });
    }
);