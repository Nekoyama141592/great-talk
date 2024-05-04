// 基本的な設定
const functions = require("firebase-functions");
const { deleteFromColRef } = require('../utils/deleteFromColRef');

// firestore
const privateUserPath = "private/{version}/privateUsers/{uid}";
exports.onBookmarkCategoryDelete = functions.firestore.document(`${privateUserPath}/bookmarkCategories/{categoryId}`).onDelete(
    async (snap,_) => {
        const ref = snap.ref;
        // カテゴリー下のブックマークを全て削除
        await deleteFromColRef(ref.collection('bookmarks'));
    }
);