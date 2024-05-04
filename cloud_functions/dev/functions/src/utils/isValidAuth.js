function isValidAuth(authHeader) {
    // 'Authorization' ヘッダーが存在しない場合、または 'Bearer' トークンを含まない場合は403エラーを返す
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      return false;
    }
    // トークンの抽出
    const token = authHeader.split('Bearer ')[1];
    if (token === process.env.API_KEY) {
      return true;
    } else {
      return false;
    }
  }
module.exports = {
  isValidAuth
};