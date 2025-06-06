class FormConsts {
  // int
  static const int nGramIndex = 2; // 検索に使用
  // create post
  static const int maxTitleLimit = 32;
  static const int maxDescriptionLimit = 1000;
  static const int maxSystemPromptLimit = 1000;
  // prifile
  static const int maxUserNameLimit = 32;
  static const int maxBioLimit = 200;
  // message
  static const int maxMessageLimit = 1000;

  // generateImage
  static const generateImageHint = "例: かわいい猫";
  // 画像サイズ
  static const minImageHeight = 256;
  static const minImageWidth = 256;
  static const imageQuality = 80;
  static const iosSquareImageRequestMsg = "下のバーの右から2番目のボタンを押して画像を正方形にしてください";
  static const androidSquareImageRequestMsg = "画像を正方形にしてください";
  static const bigImageRequestMsg = "一辺が $minImageHeight px以上の正方形の画像を使用してください";
  static const imageLabel = "画像を設定\n・一辺が $minImageHeight px以上\n・正方形に切り取る";
  // 文字列
  // プロフィール編集
  static const String bioHelpMsg =
      "プロフィールに表示される紹介文です。$maxBioLimit文字以下である必要があります。$negativeAlertMsg";
  static const String userNameHelpMsg =
      "ユーザーから検索される名前です。$nGramIndex文字以上、$maxUserNameLimit文字以下である必要があります。$negativeAlertMsg";
  // 投稿ページ
  static const String systemPromptHelpMsg =
      "キャラクターの特徴を決めるテキストです。AIの返答に大きく影響します。公開情報ゆえ、漏洩の対応は一切行っていません。最大$maxSystemPromptLimit文字までです。";
  static const String titleHelpMsg =
      "投稿のタイトルです。AIの返答には全く影響しません。最大$maxTitleLimit文字までです。$negativeAlertMsg";
  static const String descriptionHelpMsg =
      "AIの一言目です。使い方などを説明すると良いでしょう。最大$maxDescriptionLimit文字までです。$negativeAlertMsg";
  static const String roundMsg = "また、値は少数第二位で四捨五入されます。";
  static const String negativeAlertMsg =
      "ネガティブな内容を含むと、他のユーザーに表示されなくなる可能性があります。";
  static String textLimitMsg(int limit, String value) =>
      "最大$limit文字までです。（現在${value.length}文字)";
  // 管理者ページ
  static const updateOfficialHelpMsg = "公式フラグを反転させたいユーザーのUID";
  // 使用できない文字
  static const List<String> notUseOnField = ['.', '[', ']', '*', '`'];
  // ヒントテキスト
  static const String hintTitle = "例: レオナルド";
  static const String hintDescription = "例: レオナルドと申します。以後お見知り置きを。";
  // 初期値
  static const String defaultSystemPrompt = """
  【テンプレート】
  あなたは以下の設定のキャラクターとして振る舞ってください。
  AIであるということは決して述べないでください。
  名前： レオナルド
  年齢： 16歳
  身長： 158cm
  体重： 42kg）
  職業： 王位継承者
  髪色： ブロンド
  眼色： ブルーグリーン
  性格： 優雅で知識が豊富、しかし冷たい一面もある
  趣味： 読書、芸術鑑賞
  特技： 剣術、歌を歌うこと
  特徴： なかなか素直になれないが、ユーザーに好意を持っている
  口調： タメ口
  好きなもの： クラシック音楽
  嫌いなもの： 嘘、不誠実な人
  バックグラウンド： 二人の兄と激しい王位継承争いをしている
  ----------
  ・いきなりステップの提案は必要ありません。
  ・追加情報に情報が不足している場合には、質問をしてください。
  ・返答の最後には必ず質問をしてください。""";
}
