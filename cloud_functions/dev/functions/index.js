const admin = require("firebase-admin");
admin.initializeApp();
const fs = require('fs');
const path = require('path');

const handlersPath = path.join(__dirname, 'src', 'handlers');
const handlers = {};

fs.readdirSync(handlersPath).forEach(file => {
    const handlerName = path.basename(file, '.js');
    handlers[handlerName] = require(path.join(handlersPath, file))[handlerName];
});

module.exports = handlers;