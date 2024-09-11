const functions = require('firebase-functions');
const express = require('express');

const app = express();

app.get('/.well-known/assetlinks.json', (req, res) => {
  const assetlinks = [
    {
      "relation": ["delegate_permission/common.handle_all_urls"],
      "target": {
        "namespace": "android_app",
        "package_name": `${process.env.ANDROID_PKG_NAME}`,
        "sha256_cert_fingerprints": [`${process.env.DEEP_LINK_ANDROID_SHA256}`,]
      }
    }
  ];

  res.json(assetlinks);
});
app.get('/.well-known/apple-app-site-association', (req, res) => {
  const data = {
    "applinks": {
        "apps": [],
        "details": [
        {
          "appID": `${process.env.DEEP_LINK_IOS_APP_ID}`,
          "paths": ["*"]
        }
      ]
    }
  }

  res.json(data);
});

exports.app = functions.https.onRequest(app);