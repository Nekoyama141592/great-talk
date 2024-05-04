// AWS
const AWS = require('aws-sdk');
const AWS_REGION = "ap-northeast-1";
function updateAWSConfig() {
    AWS.config.update({
        accessKeyId: `${process.env.AWS_ACCESS_KEY}`,
        secretAccessKey: `${process.env.AWS_SECRET_ACCESS_KEY}`,
        region: AWS_REGION,
    });
}
module.exports = {
    updateAWSConfig
};