class ChatGPTConstants {
  static const gptTurboMaxToken = 3500; // 4096以上はエラー
  static const gptTurboMaxRequestLength = 3;
  static const gpt4MaxToken = 8000; // 9000もOK
  static const gpt4MaxRequestLength = 5;
  // model
  static const basicModel = "gpt-3.5-turbo-1106";
  static const premiumModel = "gpt-4-1106-preview";
}
