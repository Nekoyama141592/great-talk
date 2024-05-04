// 基本的な設定
const functions = require("firebase-functions");
const admin = require("firebase-admin");
const db = admin.firestore();
// firestore
const userPath = "public/{version}/users/{uid}";
const postPath = `${userPath}/posts/{postId}`;
const batchLimit = 500;
// utils
const { detectText } = require('../utils/detectText');
const { detectModerationLabels } = require('../utils/detectModerationLabels');
exports.onPostCreate = functions
.firestore.document(postPath).onCreate(
    async (snap,context) => {
        const uid = context.params.uid;
        const newValue = snap.data();
        const detectedDescription = await detectText(newValue.description.value);
        const detectedTitle = await detectText(newValue.title.value);
        const detectedImage = await detectModerationLabels(newValue.image.bucketName,newValue.image.value);
        await snap.ref.update({
            'description': detectedDescription,
            'title': detectedTitle,
            'image': detectedImage,
            'uid': uid, // TODO: 消す
        });
        // timelineを作成
        const timeline = {
            "createdAt": newValue.createdAt,
            "isRead": false,
            "posterUid": newValue.uid,
            "postId": newValue.postId,
        };
        const posterRef = db.collection('public/v1/users').doc(uid);
        await posterRef.collection('timelines').doc(newValue.postId).set(timeline); // 投稿者にもSet
        // followersをget
        const followers = await posterRef.collection("followers").get();
        let count = 0;
        let batch = db.batch();
        for (const follower of followers.docs) {
            const data = follower.data();
            // followerのtimelineを作成
            const ref = data.activeUserRef.collection("timelines").doc(newValue.postId);
            batch.set(ref,timeline);
            count++;
            if (count == batchLimit) {
                await batch.commit();
                batch = db.batch();
                count = 0;
            }
        }
        if (count > 0) {
            await batch.commit();
        }
    }
);