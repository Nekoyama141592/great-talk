enum CurrentAuthState { notLoggedIn, isAnonymous, loggedIn }

enum InterlocutorType { userContent, originalContent }

enum MessageType { text }

enum PrefsKey {
  // personIdで各々のChat履歴
  chatCount,
  initialPeople,
  isAgreedToTerms,
  isV3initialized,
  lastChatDate,
}
enum SearchTarget { post,user}
enum TokenType { following, likePost, mutePost, muteUser, reportPost }
