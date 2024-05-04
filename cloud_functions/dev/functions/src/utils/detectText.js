const AWS = require('aws-sdk');
const { updateAWSConfig } = require('./updateAWSConfig');
const { detectDominantLanguage } = require('./detectDominantLanguage');
async function detectText(text) {
    updateAWSConfig();
    const comprehend = new AWS.Comprehend({apiVersion: '2017-11-27'});
    let detectedText = {
        "languageCode": "",
        "negativeScore": 0,
        "positiveScore": 0,
        "sentiment": "",
        "value": text,
    };

    if (!text || text.trim() === "") {
        return detectedText;
    }

    try {
        const lCode = await detectDominantLanguage(text);
        if (!lCode || lCode.trim() === "") {
            return detectedText;
        }
        if (lCode) {
            const dSparams = {
                LanguageCode: lCode,
                Text: text,
            };

            const dSdata = await new Promise((resolve, reject) => {
                comprehend.detectSentiment(dSparams, (dSerr, dSdata) => {
                    if (dSerr) {
                        reject(dSerr);
                    } else {
                        resolve(dSdata);
                    }
                });
            });

            detectedText = {
                "languageCode": lCode,
                "negativeScore": mul100AndRoundingDown(dSdata.SentimentScore.Negative),
                "positiveScore": mul100AndRoundingDown(dSdata.SentimentScore.Positive),
                "sentiment": dSdata.Sentiment,
                "value": text,
            };
        }

        return detectedText;
    } catch (error) {
        console.log(error);
        return detectedText;
    }
}
module.exports = {
    detectText
};