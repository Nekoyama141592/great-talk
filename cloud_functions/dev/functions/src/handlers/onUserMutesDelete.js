// 基本的な設定
const functions = require("firebase-functions");
const admin = require("firebase-admin");

// firestore
const userPath = "public/{version}/users/{uid}";
const minusOne = -1;

exports.onUserMutesDelete = functions.firestore.document(`${userPath}/userMutes/{activeUid}`).onDelete(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.passiveUserRef.update({
            'muteCount': admin.firestore.FieldValue.increment(minusOne),
        });
    }
);