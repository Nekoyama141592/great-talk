function chunkSplit(str, len, end) {
    const match = str.match(new RegExp('.{0,' + len + '}', 'g'));
    if (!match) {
        return '';
    }

    return match.join(end);
}
module.exports = {
    chunkSplit
};