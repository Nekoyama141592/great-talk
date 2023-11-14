class ChatGPTConstants {
  static const gptTurboMaxToken = 3000;
  static const gptTurboMaxRequestLength = 3;
  static const gpt4MaxToken = 6000;
  static const gpt4MaxRequestLength = 5;
  static const attention = """
  ----------
  ・具体的な回答を導き出すために、指示ないに不足する情報を必ず質問してください。
  ・追加情報に情報が不足している場合にも、質問をしてください。
  ・繰り返し何度も質問をしてください。
  ・いきなりステップの提案は必要ありません。
  ・事例や条件が必要な場合にはそれに対応する質問をしてください。""";
}
