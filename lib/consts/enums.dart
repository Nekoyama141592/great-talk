enum CurrentAuthState { notLoggedIn, isAnonymous, loggedIn }

enum InterlocutorType { userContent, originalContent }

enum MessageType { text }

enum PrefsKey {
  // ${contentId}で各々のChat履歴
  // ${fileName}でキャッシュされた画像
  chatCountToday,
  initialPeople,
  isAgreedToTerms,
  isDarkTheme,
  isV3initialized,
  lastChatDate,
  latestReceipt,
  needFirstMessage
}

enum SearchTarget { post, user }

enum TokenType { following, likePost, mutePost, muteUser, reportPost }
