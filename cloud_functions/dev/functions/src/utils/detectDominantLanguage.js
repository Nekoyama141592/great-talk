const AWS = require('aws-sdk');
const { updateAWSConfig } = require('./updateAWSConfig');
async function detectDominantLanguage(text) {
    updateAWSConfig();
    const comprehend = new AWS.Comprehend({apiVersion: '2017-11-27'});
    let lCode = '';
    
    if (!text || text.trim() === "") {
        return lCode;
    }
    
    const dDparams = {
        Text: text
    };

    try {
        const dDdata = await new Promise((resolve, reject) => {
            comprehend.detectDominantLanguage(dDparams, (dDerr, dDdata) => {
                if (dDerr) {
                    reject(dDerr);
                } else {
                    resolve(dDdata);
                }
            });
        });

        lCode = dDdata.Languages[0]["LanguageCode"];
        return lCode;
    } catch (error) {
        console.log(error);
        return lCode;
    }
}
module.exports = {
    detectDominantLanguage
};