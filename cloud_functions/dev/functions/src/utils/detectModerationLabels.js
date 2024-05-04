const AWS = require('aws-sdk');
const { updateAWSConfig } = require('./updateAWSConfig');
async function detectModerationLabels(bucketName, fileName) {
    updateAWSConfig();
    const rekognition = new AWS.Rekognition();
    let detectedImage = {
        "bucketName": bucketName,
        "moderationLabels": [],
        "moderationModelVersion": '',
        "value": fileName,
    };

    if (!bucketName || bucketName.trim() === "" || !fileName || fileName.trim() === "") {
        return detectedImage;
    }

    try {
        const params = {
            Image: {
                S3Object: {
                    Bucket: bucketName,
                    Name: fileName,
                },
            },
            MinConfidence: 60,
        };

        const moderationLabelsResponse = await rekognition.detectModerationLabels(params).promise();

        detectedImage = {
            "bucketName": bucketName,
            "moderationLabels": moderationLabelsResponse.ModerationLabels,
            "moderationModelVersion": moderationLabelsResponse.ModerationModelVersion,
            "value": fileName,
        };
    } catch (error) {
        console.error('Error:', error);
    }

    return detectedImage;
}
module.exports = {
    detectModerationLabels
};