enum CurrentAuthState { notLoggedIn, isAnonymous, loggedIn }

enum InterlocutorType { userContent, originalContent }

enum MessageType { text }

enum PrefsKey {
  // ${contentId}で各々のChat履歴
  // isExplained_${contentId}でfalseならダイアログを表示
  chatCount,
  initialPeople,
  isAgreedToTerms,
  isDarkTheme,
  isV3initialized,
  lastChatDate,
}

enum SearchTarget { post, user }

enum TokenType {
  bookmarkCategory,
  following,
  likePost,
  mutePost,
  muteUser,
  reportPost
}
