function saveDataToFirestore(json, colRef, id) {
    return colRef.doc(id).set(json);
}
module.exports = {
    saveDataToFirestore
};