const ai = require('openai');
const {onCall, HttpsError} = require("firebase-functions/v2/https");
const admin = require("firebase-admin");

exports.generateText = onCall(async (request) => {
 try {
    const client = new ai.OpenAI({
        apiKey: process.env.OPENAI_API_KEY
    });
    const text = request.data.text;
    const chatCompletion = await client.chat.completions.create({
      messages: [{ role: 'user', content: text }],
      model: "gpt-4o-mini",
    });
    const message = chatCompletion.choices[0].message.content;
    return {message}
 } catch(e) {
    const errorMsg = `${e}`
    await admin.firestore().collection('errors').doc().set({
        error: errorMsg
    })
    throw new HttpsError("failure", errorMsg);
 }
});
