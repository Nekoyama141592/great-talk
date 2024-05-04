// 基本的な設定
const functions = require("firebase-functions");
// firestore
const userPath = "public/{version}/users/{uid}";
// utils
const { detectText } = require('../utils/detectText');
const { detectModerationLabels } = require('../utils/detectModerationLabels');

exports.onUserUpdateLogCreate = functions
.firestore.document(`${userPath}/userUpdateLogs/{id}`).onCreate(
    async (snap,_) => {
        const newValue = snap.data();
        const userRef = newValue.userRef;

        const oldUser = await userRef.get();
        const oldUserJson = oldUser.data();
        const detectedUserName = {
            "languageCode": "",
            "negativeScore": 0,
            "positiveScore": 0,
            "sentiment": "",
            "value": newValue.stringUserName,
        };
        const newBio = newValue.stringBio;
        const detectedBio = (newBio === oldUserJson['bio']['value']) ? oldUserJson['bio'] : await detectText(newBio);
        const newImage = newValue.image;
        const newBucketName = newImage.bucketName;
        const newFileName = newImage.value;
        const detectedImage = (newFileName === oldUserJson['image']['value']) ? oldUserJson['image'] : await detectModerationLabels(newBucketName,newFileName);
        await userRef.update({
            'bio': detectedBio,
            'image': detectedImage,
            'searchToken': newValue.searchToken,
            'userName': detectedUserName,
        });
    }
);