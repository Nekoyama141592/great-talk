const { chunkSplit } = require('./chunkSplit');
function getPrivateKey(privateKey) {
    const key  = chunkSplit(privateKey, 64, '\n');
    const pkey = '-----BEGIN PRIVATE KEY-----\n' + key + '-----END PRIVATE KEY-----\n';

    return pkey;
}
module.exports = {
    getPrivateKey
};