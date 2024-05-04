function mul100AndRoundingDown(num) {
    const mul100 = num * 100; // ex) 0.9988を99.88にする
    const result = Math.floor(mul100); // 数字を丸める
    return result;
}
module.exports = {
    mul100AndRoundingDown
};