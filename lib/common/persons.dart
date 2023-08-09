import 'package:great_talk/model/chat_content/chat_content.dart';

const String officialId = "sugoi-ai-official";
const String chatGPTId = "chatGPT";
const String wolframId = "wolfram";
// 現在のユーザーを定義.
bool returnIsOriginalContents(String uid) => uid == officialId;

final originalContentIds = originalContents.map((e) => e.contentId).toList();
final proIds = proPeople.map((e) => e.contentId).toList();
final greatIds = greatPeople.map((e) => e.contentId).toList();
final List<ChatContent> originalContents = [
  ...ai,
  ...greatPeople,
  ...proPeople,
];
const ai = [
  ChatContent(
      posterUid: officialId,
      contentId: chatGPTId,
      title: 'なんでもAI',
      imageValue:
          'https://pbs.twimg.com/media/FqNXz8saAAEdaXz?format=jpg&name=medium'),
  ChatContent(
      posterUid: officialId,
      contentId: wolframId,
      title: '数学の先生',
      imageValue:
          'https://cdn.pixabay.com/photo/2016/10/29/14/49/cube-1780775__480.jpg'),
];
const proPeople = [
  ChatContent(
      posterUid: officialId,
      contentId: 'human-resources',
      title: '人事の専門家',
      metadata: {
        'description': '組織の人的資源を最大限に活用するための戦略を策定することを専門とする人',
      },
      imageValue:
          'https://cdn.pixabay.com/photo/2017/11/02/14/27/model-2911332__480.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'chef',
      title: 'シェフ',
      metadata: {'description': '料理の専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1654922207993-2952fec328ae?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2hlZnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60'),
  ChatContent(
      posterUid: officialId,
      contentId: 'patissier',
      title: 'パティシエ',
      metadata: {'description': 'お菓子の専門家'},
      imageValue:
          "https://images.unsplash.com/photo-1519733870-f96bef9bc85f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8cGF0aXNzaWVyfGVufDB8fHx8MTY3OTQwMDk3MQ&ixlib=rb-4.0.3&q=80&w=400"),
  ChatContent(
      posterUid: officialId,
      contentId: 'counselor',
      title: '心理カウンセラー',
      metadata: {'description': '心理的問題について相談に乗る専門家'},
      imageValue:
          'https://cdn.pixabay.com/photo/2017/03/26/21/54/yoga-2176668__480.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'doctor',
      title: '医師',
      metadata: {'description': '病気の診断や治療を行う専門家'},
      imageValue:
          'https://cdn.pixabay.com/photo/2017/03/14/03/20/woman-2141808__480.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'lawyer',
      title: '弁護士',
      metadata: {'description': '法律の専門家'},
      imageValue:
          'https://cdn.pixabay.com/photo/2015/04/12/16/33/hammer-719066__480.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'teacher',
      title: '教師',
      metadata: {'description': '教育の専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1544717305-2782549b5136?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8dGVhY2hlcnxlbnwwfHx8fDE2NzkzMjMyNDY&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'economist',
      title: '経済学者',
      metadata: {'description': '経済の専門家'},
      imageValue:
          'https://media.istockphoto.com/id/1311598658/ja/%E3%82%B9%E3%83%88%E3%83%83%E3%82%AF%E3%83%95%E3%82%A9%E3%83%88/%E3%83%86%E3%83%96%E3%83%AC%E3%83%83%E3%83%88%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E4%B8%8A%E3%81%AE%E3%83%93%E3%82%B8%E3%83%8D%E3%82%B9%E3%83%9E%E3%83%B3%E5%8F%96%E5%BC%95%E3%82%AA%E3%83%B3%E3%83%A9%E3%82%A4%E3%83%B3%E6%A0%AA%E5%BC%8F%E5%B8%82%E5%A0%B4%E3%83%87%E3%82%B8%E3%82%BF%E3%83%AB%E6%8A%95%E8%B3%87%E3%82%B3%E3%83%B3%E3%82%BB%E3%83%97%E3%83%88.jpg?s=612x612&w=0&k=20&c=kqXUEqaFyjbF5CxeOe8vq7mzP_DoY3McexsjUq60VbA='),
  ChatContent(
      posterUid: officialId,
      contentId: 'engineer',
      title: '工学者',
      metadata: {'description': '技術の専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1581092163144-b7ae3c00adbc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8NXx8ZW5naW5lZXJ8ZW58MHx8fHwxNjc5MzUyNzk4&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'gardener',
      title: '園芸家',
      metadata: {'description': '植物の栽培や育成についての専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziARbQaUAARgsn?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'architect',
      title: '建築家',
      metadata: {'description': '建築物の設計や監修をする専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziASQfaIAEIYkQ?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'furnitureDesigner',
      title: '家具デザイナー',
      metadata: {'description': '家具のデザインに特化した専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziATCzaMAEacn2?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'filmDirector',
      title: '映画監督',
      metadata: {'description': '映画製作において指導・監督を行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziAT-NaIAAARTe?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'painter',
      title: '画家',
      metadata: {'description': '絵画を描く専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziBZLVaUAAwlMN?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'interiorDesigner',
      title: 'インテリアデザイナー',
      metadata: {'description': '家具、カーテン、照明などのインテリアデザインに特化した専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziBaJeaAAAketb?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'fashionDesigner',
      title: 'ファッションデザイナー',
      metadata: {'description': '衣服やアクセサリーのデザインに特化した専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziBbgCakAAhPGT?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'photographer',
      title: '写真家',
      metadata: {'description': '写真を撮影する専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziBdzBaQAAQmNO?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'geologist',
      title: '地質学者',
      metadata: {'description': '地球の地質や地形を研究する専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziCGhCaQAMw1WL?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'linguist',
      title: '言語学者',
      metadata: {'description': '言語や言語現象を研究する専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziCIMqaEAE8zF3?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'statistician',
      title: '統計学者',
      metadata: {'description': 'データを分析して情報を得る専門家'},
      imageValue:
          'https://cdn.pixabay.com/photo/2018/08/18/13/26/interface-3614766__480.png'),
  ChatContent(
      posterUid: officialId,
      contentId: 'game-designer',
      title: 'ゲームデザイナー',
      metadata: {'description': 'ビデオゲームの開発に特化した専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1542751371-adc38448a05e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8dmlkZW8lMjBnYW1lfGVufDB8fHx8MTY3OTQwMzQ0NQ&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'data-scientist',
      title: 'データサイエンティスト',
      metadata: {'description': '大量のデータを収集・分析して、ビジネスの意思決定をサポートする専門家'},
      imageValue:
          'https://cdn.pixabay.com/photo/2015/12/03/22/15/tablet-1075790_1280.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'cartographer',
      title: '地図学者',
      metadata: {'description': '地図を作成し、地理情報の収集・管理に従事する専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziCJqxaEAAfalH?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'biologist',
      title: '生物学者',
      metadata: {'description': '生物についての研究を行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziCLN0agAArXn7?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'marketer',
      title: 'マーケター',
      metadata: {'description': '商品やサービスの販売促進に特化した専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziC593agAEbVER?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'entertainment-producer',
      title: '芸能プロデューサー',
      metadata: {'description': '芸能活動においてタレントのマネジメントやイベントの企画・運営に従事する専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziC75magAE9lYC?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'tv-director',
      title: 'テレビディレクター',
      metadata: {'description': 'テレビ番組の制作において指揮をとる専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziC_H9aAAAn6fK?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'veterinarian',
      title: '獣医師',
      metadata: {'description': '動物の疾患の診断・治療を行う専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1628009368231-7bb7cfcb0def?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8Mnx8dmV0ZXJpbmFyaWFufGVufDB8fHx8MTY3OTM2ODcyOA&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'massage-therapist',
      title: 'マッサージ師',
      metadata: {'description': '身体のストレスや痛みの緩和を目的とした施術を行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziDBfVaUAAW0bP?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'researcher',
      title: '研究者',
      metadata: {'description': 'あるテーマについて研究を行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziDeYaaQAMamTq?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'sportsTrainer',
      title: 'スポーツトレーナー',
      metadata: {'description': 'スポーツ選手のコンディショニングやケガの予防・治療に従事する専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1604480133435-25b86862d276?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MjF8fHRyYWluZXJ8ZW58MHx8fHwxNjc5Mzk3MDE5&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'newsCaster',
      title: 'ニュースキャスター',
      metadata: {'description': 'ニュース番組の司会や報道に従事する専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1619743088831-4d2c38b40cce?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8bWlrZSUyMHBlcnNvbnxlbnwwfHx8fDE2Nzk0MDM4NTI&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'socialWorker',
      title: 'ソーシャルワーカー',
      metadata: {'description': '社会福祉や保健の問題に対して支援を行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziDfkfaIAATDZE?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'consultant',
      title: 'コンサルタント',
      metadata: {'description': '企業や組織の業務改善や問題解決のためのアドバイスを行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziDgdyaYAAlnac?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'nurse',
      title: '看護師',
      metadata: {'description': '病院やクリニックで患者さんの健康管理や医療に関わる専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1584432810601-6c7f27d2362b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8bnVyc2V8ZW58MHx8fHwxNjc5Mzk5MDI0&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'sociologist',
      title: '社会学者',
      metadata: {'description': '社会の構造や社会問題を研究する専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziDiMfaMAIFMpK?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'illustrator',
      title: 'イラストレーター',
      metadata: {'description': '絵を描くことに特化した専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziEILGaAAUCtws?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'soundEngineer',
      title: 'サウンドエンジニア',
      metadata: {'description': '音響の専門家で、音楽や映画、テレビなどの音響を制作する専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1520872024865-3ff2805d8bb3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTh8fHNpbmd8ZW58MHx8fHwxNjc5MzgyOTc5&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'seismologist',
      title: '地震学者',
      metadata: {'description': '地震や地殻変動を研究する専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziEJWUaIAE1ypl?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'foodsanitation',
      title: '食品衛生士',
      metadata: {'description': '食品の衛生管理に特化した専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziEKTZakAEOvOz?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'webdesigner',
      title: 'ウェブデザイナー',
      metadata: {'description': 'ウェブサイトのデザインに特化した専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziEL96aMAESS47?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'environmentalist',
      title: '環境保護活動家',
      metadata: {'description': '環境問題に関する啓発活動や対策の提言を行う専門家'},
      imageValue:
          'https://cdn.pixabay.com/photo/2023/02/14/04/39/volunteer-7788809_1280.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'copywriter',
      title: 'コピーライター',
      metadata: {'description': '広告や宣伝のためのキャッチコピーを考える専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziE1QcaUAAKMsQ?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'manager',
      title: 'マネージャー',
      metadata: {'description': 'アーティストやスポーツ選手、企業などのマネジメントを行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziE23XaUAIwcjP?format=jpg&name=360x360'),
  ChatContent(
      posterUid: officialId,
      contentId: 'educationalist',
      title: '教育学者',
      metadata: {'description': '教育に関する研究や分析を行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziE4BZakAEek-e?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'foodStylist',
      title: 'フードスタイリスト',
      metadata: {'description': '料理や食材のスタイリングに特化した専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1526683224143-73288bb6996e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTd8fGVhdHxlbnwwfHx8fDE2Nzk0MDQ1MzE&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'fitnessInstructor',
      title: 'フィットネスインストラクター',
      metadata: {'description': '健康やフィットネスに関する指導を行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziE5FxaMAAcHHv?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'civilEngineer',
      title: '土木技術者',
      metadata: {'description': '道路や橋などの土木工事に関する技術的なアドバイスを行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziF7B8aUAAh4KK?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'technicalWriter',
      title: 'テクニカルライター',
      metadata: {'description': '科学技術や医学などの専門的な知識を持ったライター'},
      imageValue:
          'https://pbs.twimg.com/media/FziF8d_agAAiQGv?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'freelanceWriter',
      title: 'ジャーナリスト',
      metadata: {'description': '作家やジャーナリストなど、フリーランスで執筆活動を行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziF-UIaYAIhzfC?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'itConsultant',
      title: 'ITコンサルタント',
      metadata: {'description': 'コンピューターシステムやソフトウェアのアドバイスを行う専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1583508915901-b5f84c1dcde1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTh8fGZyZWVsYW5jZXxlbnwwfHx8fDE2NzkzMjI1ODU&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'gemologist',
      title: '宝石鑑定士',
      metadata: {'description': '宝石の鑑定に特化した専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1610575528294-97e56df074f9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8Z2VtJTIwcGVyc29ufGVufDB8fHx8MTY3OTQwNDcwMA&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'financialPlanner',
      title: 'ファイナンシャルプランナー',
      metadata: {'description': '資産運用やライフプランに関するアドバイスを行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziF_kcakAEmvuZ?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'aromatherapist',
      title: 'アロマセラピスト',
      metadata: {'description': 'アロマオイルを使用したセラピーを行う専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1515377905703-c4788e51af15?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8YXJvbWF8ZW58MHx8fHwxNjc5MzU3MjQ1&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'stylist',
      title: 'スタイリスト',
      metadata: {'description': '衣服やメイクアップのスタイリングに特化した専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziGejJaQAAPKip?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'homeStager',
      title: 'ホームステージャー',
      metadata: {'description': '不動産物件の内装装飾やレイアウトのアドバイスを行う専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1523217582562-09d0def993a6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTZ8fGhvbWV8ZW58MHx8fHwxNjc5NDA0ODE2&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'graphicDesigner',
      title: 'グラフィックデザイナー',
      metadata: {'description': '広告やポスター、パンフレットなどのデザインに特化した専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1622119029245-5bf43951115a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8N3x8dWl8ZW58MHx8fHwxNjc5NDA0ODU5&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'pharmacist',
      title: '薬剤師',
      metadata: {'description': '薬剤や薬の効果・副作用に関する専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziGgGWagAEygJm?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'sportsTrainer',
      title: 'スポーツトレーナー',
      metadata: {'description': 'スポーツ選手やアスリートの身体管理やトレーニング指導を行う専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1517438984742-1262db08379e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTd8fHRyYWluZXJ8ZW58MHx8fHwxNjc5Mzk3MDE5&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'housekeeper',
      title: 'ハウスキーパー',
      metadata: {'description': '家事代行や掃除、洗濯、料理などの家庭サービスを提供する専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1578593195423-df7df9563457?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8aG91c2VrZWVwZXJ8ZW58MHx8fHwxNjc5NDA0OTQ0&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'prosecutor',
      title: '検察官',
      metadata: {'description': '刑事司法の専門家で、犯罪の捜査や訴追を行う'},
      imageValue:
          'https://images.unsplash.com/photo-1649653084130-06638e40ca25?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8NHx8cHJvc2VjdXRvcnxlbnwwfHx8fDE2Nzk0MDQ5Nzc&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'radioDJ',
      title: 'ラジオDJ',
      metadata: {'description': 'ラジオ番組のパーソナリティとして、音楽やトークを担当する専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziGhc-aMAISHzt?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'projectManager',
      title: 'プロジェクトマネージャー',
      metadata: {'description': 'プロジェクトの計画や進行管理、チームのコーディネートを行う専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1531403009284-440f080d1e12?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8cHJvamVjdCUyMG1hbmFnZXJ8ZW58MHx8fHwxNjc5NDA1MDYw&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'speechTherapist',
      title: 'スピーチセラピスト',
      metadata: {'description': '言語障害のある人のために、コミュニケーションスキルを向上させるセラピーを行う専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1576778453123-ab240b89dd52?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MjJ8fHNwZWVjaHxlbnwwfHx8fDE2NzkzNDk1MTE&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'managementConsultant',
      title: '経営コンサルタント',
      metadata: {'description': '経営戦略やマーケティング戦略に関するアドバイスを行う専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1600880292203-757bb62b4baf?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8OHx8Y29uc3VsdGFudHxlbnwwfHx8fDE2NzkzNzc1ODY&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'artDirector',
      title: 'アートディレクター',
      metadata: {'description': '広告や映像作品、出版物などのアートディレクションを行う専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1598387746216-506f6bd47aad?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8YXJ0JTIwZGlyZWN0b3J8ZW58MHx8fHwxNjc5NDA1MjY5&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'hotelManager',
      title: 'ホテルマネージャー',
      metadata: {'description': 'ホテル運営に関する全般的なマネジメントを行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziGkveaEAAGHIy?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'personalTrainer',
      title: 'パーソナルトレーナー',
      metadata: {'description': '個人的なフィットネスプランの作成やトレーニング指導を行う専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1519311965067-36d3e5f33d39?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8cGVyc29uYWwlMjB0cmFpbmVyfGVufDB8fHx8MTY3OTQwNTM0MQ&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'translator',
      title: '翻訳家',
      metadata: {'description': '外国語の翻訳に特化した専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1575707751065-42256084fbb7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8OXx8c3BlZWNofGVufDB8fHx8MTY3OTM0OTUxMQ&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'audioEngineer',
      title: '音響エンジニア',
      metadata: {'description': '音楽や映画、テレビ番組などの音響に特化した専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziHTC8aEAA5y1t?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'producer',
      title: 'プロデューサー',
      metadata: {'description': 'テレビ番組、映画、音楽などの制作に関わる専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1516223725307-6f76b9ec8742?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8Nnx8cHJvZHVjZXJ8ZW58MHx8fHwxNjc5NDAzNTQ5&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'marketingSpecialist',
      title: 'マーケティング担当者',
      metadata: {'description': '製品やサービスの販売戦略を立案し、マーケティング活動を行う専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1670272505497-d532f0b50702?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDF8MXxzZWFyY2h8MXx8b2ZmaWNlfGVufDB8fHx8MTY3OTM1ODI2OQ&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'mentalHealthCounselor',
      title: 'メンタルヘルスカウンセラー',
      metadata: {'description': '心理学やカウンセリングの知識を持ち、メンタルヘルスに関する相談やアドバイスを行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziHUbzaMAEJocZ?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'animator',
      title: 'アニメーター',
      metadata: {'description': 'アニメーション映画やテレビ番組の制作に携わる専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziHWC8aQAAcpuO?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'businessConsultant',
      title: 'ビジネスコンサルタント',
      metadata: {'description': '企業や組織の経営や業務改善に関するアドバイスを行う専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1664575599730-0814817939de?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8N3x8YnVzaW5lc3N8ZW58MHx8fHwxNjc5MzYyNTEx&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'policeOfficer',
      title: '警察官',
      metadata: {'description': '治安維持や交通規制、犯罪の捜査や防止などを行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziHW6DacAIh63y?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'photographer',
      title: 'フォトグラファー',
      metadata: {'description': '写真撮影に特化した専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1625492922105-5914617fd869?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTh8fHBob3RvZ3JhcGhlcnxlbnwwfHx8fDE2Nzk0MDU4OTk&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'organizer',
      title: 'オーガナイザー',
      metadata: {'description': '収納や片付けのアドバイスを行う専門家'},
      imageValue:
          'https://images.unsplash.com/photo-1577415124269-fc1140a69e91?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8NTJ8fGJ1c2luZXNzfGVufDB8fHx8MTY3OTM2MjUxMg&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'restaurantOwner',
      title: 'レストランオーナー',
      metadata: {'description': '飲食店の経営を行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziH0lJaUAANQ9S?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'securityConsultant',
      title: 'セキュリティコンサルタント',
      metadata: {'description': '防犯対策や情報セキュリティに関するアドバイスを行う専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziH1l2aIAUYUrK?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'programmer',
      title: 'プログラマー',
      metadata: {'description': 'コンピュータプログラムの開発や保守に関する専門家'},
      imageValue:
          'https://pbs.twimg.com/media/FziH3ktagAIaL9f?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'aircraftPilot',
      title: '航空機パイロット',
      metadata: {
        'description': '航空機の操縦や運航に関する専門家',
      },
      imageValue:
          'https://pbs.twimg.com/media/FziH5NDaYAQFy97?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'logoDesigner',
      title: 'ロゴデザイナー',
      metadata: {
        'description': 'ロゴやブランディングに関するデザインに特化した専門家',
      },
      imageValue:
          'https://images.unsplash.com/photo-1612831660846-778e3a5548bd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTZ8fGRlc2lnbmVyfGVufDB8fHx8MTY3OTQwNjIyMQ&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'speechTrainer',
      title: 'スピーチトレーナー',
      metadata: {
        'description': 'スピーチやプレゼンテーションの指導に特化した専門家',
      },
      imageValue:
          'https://images.unsplash.com/photo-1564522365984-c08ed1f78893?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8c3BlZWNofGVufDB8fHx8MTY3OTM0OTUxMQ&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'writer',
      title: 'ライター',
      metadata: {
        'description': '文章の執筆や編集に特化した専門家',
      },
      imageValue:
          'https://pbs.twimg.com/media/FziIQbvakAYjf_-?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'securitiesAnalyst',
      title: '証券アナリスト',
      metadata: {
        'description': '株式や債券などの投資商品の分析や予測に関する専門家',
      },
      imageValue:
          'https://pbs.twimg.com/media/FziIScWaAAAngrt?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'webMarketer',
      title: 'ウェブマーケター',
      metadata: {
        'description': 'ウェブサイトやソーシャルメディアを活用したマーケティングに関する専門家',
      },
      imageValue:
          'https://images.unsplash.com/photo-1557804506-669a67965ba0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8d2ViJTIwbWFya2V0ZXJ8ZW58MHx8fHwxNjc5NDA2NDU1&ixlib=rb-4.0.3&q=80&w=400'),
  ChatContent(
      posterUid: officialId,
      contentId: 'beautician',
      title: '美容師',
      metadata: {
        'description': '髪型やメイクなどの美容に特化した専門家',
      },
      imageValue:
          'https://pbs.twimg.com/media/FziITdwaEDML9jT?format=jpg&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'robot-designer',
      title: 'ロボットデザイナー',
      metadata: {
        'description': '色彩を利用して心理的な問題を解決する専門職',
      },
      imageValue:
          'https://pbs.twimg.com/media/FziIU20aQAEziVA?format=jpg&name=small'),
];
const greatPeople = [
  ChatContent(
      posterUid: officialId,
      contentId: 'Albert-Einstein.',
      title: 'アルベルト・アインシュタイン',
      imageValue:
          'https://pbs.twimg.com/media/F2lU4WiakAANIPS?format=png&name=small'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Isaac-Newton',
      title: 'アイザック・ニュートン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/GodfreyKneller-IsaacNewton-1689.jpg/225px-GodfreyKneller-IsaacNewton-1689.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Charles-Darwin',
      title: 'チャールズ・ダーウィン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Hw-darwin.jpg/225px-Hw-darwin.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Galileo-Galilei',
      title: 'ガリレオ・ガリレイ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Galileo-sustermans2.jpg/225px-Galileo-sustermans2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Leonardo-da-Vinci',
      title: 'レオナルド・ダ・ヴィンチ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Leonardo_da_Vinci_-_presumed_self-portrait_-_WGA12798.jpg/220px-Leonardo_da_Vinci_-_presumed_self-portrait_-_WGA12798.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Pythagoras',
      title: 'ピタゴラス',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Kapitolinischer_Pythagoras_adjusted.jpg/200px-Kapitolinischer_Pythagoras_adjusted.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Carl-Friedrich-Gauss',
      title: 'カール・フリードリヒ・ガウス',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Carl_Friedrich_Gauss.jpg/225px-Carl_Friedrich_Gauss.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Nikola-Tesla',
      title: 'ニコラ・テスラ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Tesla_Sarony.jpg/225px-Tesla_Sarony.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Michael-Faraday',
      title: 'マイケル・ファラデー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Michael_Faraday_001.jpg/200px-Michael_Faraday_001.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Srinivasa-Ramanujan',
      title: 'シュリニヴァーサ・ラマヌジャン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Srinivasa_Ramanujan_-_OPC_-_1.jpg/450px-Srinivasa_Ramanujan_-_OPC_-_1.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: "Yosa-no-Akiko",
      title: "与謝野晶子",
      imageValue:
          "https://upload.wikimedia.org/wikipedia/commons/7/72/Akiko_Yosano_younger.jpg"),
  ChatContent(
      posterUid: officialId,
      contentId: 'Jean-Henri-Fabre.',
      title: 'ジャン・アンリ・ファーブル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Jean-henri_fabre.jpg/225px-Jean-henri_fabre.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Louis-Pasteur',
      title: 'ルイ・パスツール',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Louis_Pasteur.jpg/225px-Louis_Pasteur.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Ukichiro-Nakatani',
      title: '中谷宇吉郎',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Nakaya_Ukichiro_in_1946.jpg/250px-Nakaya_Ukichiro_in_1946.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Shibasaburo-Kitasato',
      title: '北里柴三郎',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Kitasato_Shibasaburo.jpg/250px-Kitasato_Shibasaburo.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Antoine-Lavoisier',
      title: 'アントワーヌ・ラヴォアジエ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/David_-_Portrait_of_Monsieur_Lavoisier_%28cropped%29.jpg/225px-David_-_Portrait_of_Monsieur_Lavoisier_%28cropped%29.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'the-Wright-brothers',
      title: 'ライト兄弟',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Wilbur_Wright.jpg/150px-Wilbur_Wright.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Marie-Curie.',
      title: 'マリ・キュリー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Marie_Curie_1903.jpg/225px-Marie_Curie_1903.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Alfred-Wegener',
      title: 'アルフレート・ヴェーゲナー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Alfred_Wegener_ca.1924-30.jpg/250px-Alfred_Wegener_ca.1924-30.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'I-no-Tadataka',
      title: '伊能忠敬',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/I-no-tadataka%2Csawara%2Ckatori-city%2Cjapan.JPG/200px-I-no-tadataka%2Csawara%2Ckatori-city%2Cjapan.JPG'),
  ChatContent(
      posterUid: officialId,
      contentId: 'James-Watt',
      title: 'ジェームズ・ワット',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Watt_James_von_Breda.jpg/250px-Watt_James_von_Breda.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Dmitri-Mendeleyev',
      title: 'ドミトリ・メンデレーエフ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/DIMendeleevCab.jpg/225px-DIMendeleevCab.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Tomitaro-Makino',
      title: '牧野富太郎',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Makino_Tomitaro.jpg/200px-Makino_Tomitaro.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Gregor-Johan-Mendel.',
      title: 'グレゴール・ヨハン・メンデル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Gregor_Mendel.png/225px-Gregor_Mendel.png'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Fritjof-Nansen.',
      title: 'フリチョフ・ナンセン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Bundesarchiv_Bild_102-09772%2C_Fridjof_Nansen.jpg/200px-Bundesarchiv_Bild_102-09772%2C_Fridjof_Nansen.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Sugita-Genpaku',
      title: '杉田玄白',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Sugita_Genpaku.jpg/220px-Sugita_Genpaku.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Jean-François-Champollion',
      title: 'ジャン＝フランソワ・シャンポリオン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Jean-Francois_Champollion_2.jpg/250px-Jean-Francois_Champollion_2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Nagaoka-Hantaro',
      title: '長岡半太郎',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Hantaro_Nagaoka.jpg/225px-Hantaro_Nagaoka.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'James-Clark-Maxwell.',
      title: 'ジェームズ・クラーク・マクスウェル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/James_Clerk_Maxwell.png/225px-James_Clerk_Maxwell.png'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Kotaro-Honda',
      title: '本多光太郎',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Kotaro_Honda.jpg/200px-Kotaro_Honda.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Paul-Ehrlich',
      title: 'パウル・エールリヒ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Paul_Ehrlich_1915.jpg/200px-Paul_Ehrlich_1915.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Niels-Bohr.',
      title: 'ニールス・ボーア',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Niels_Bohr.jpg/225px-Niels_Bohr.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Archimedes',
      title: 'アルキメデス',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Retrato_de_un_erudito_%28%C2%BFArqu%C3%ADmedes%3F%29%2C_por_Domenico_Fetti.jpg/225px-Retrato_de_un_erudito_%28%C2%BFArqu%C3%ADmedes%3F%29%2C_por_Domenico_Fetti.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'John-Dalton',
      title: 'ジョン・ドルトン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Dalton_John_desk.jpg/240px-Dalton_John_desk.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'William-Ramsey',
      title: 'ウィリアム・ラムゼー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/William_Ramsay.jpg/180px-William_Ramsay.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Hideki-Yukawa',
      title: '湯川秀樹',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Yukawa.jpg/225px-Yukawa.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Konstantin-Tsiolkovsky.',
      title: 'コンスタンチン・ツィオルコフスキー',
      imageValue: 'https://weblio.hs.llnwd.net/e7/img/dict/spchk/207.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Justus-von-Liebig',
      title: 'ユストゥス・フォン・リービッヒ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/b/b2/Justus_von_Liebig.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Antoni-van-Leeuwenhoek.',
      title: 'アントニ・ファン・レーウェンフック',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Jan_Verkolje_-_Antonie_van_Leeuwenhoek.jpg/225px-Jan_Verkolje_-_Antonie_van_Leeuwenhoek.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Hiraga-Gennai',
      title: '平賀源内',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/A_Portrait_of_Ky%C5%ABkei_Hiraga_cropped.jpg/250px-A_Portrait_of_Ky%C5%ABkei_Hiraga_cropped.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Alexander-Graham-Bell.',
      title: 'アレクサンダー・グラハム・ベル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Alexander_Graham_Bell.jpg/225px-Alexander_Graham_Bell.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Ernest-Rutherford.',
      title: 'アーネスト・ラザフォード',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Ernest_Rutherford_LOC.jpg/250px-Ernest_Rutherford_LOC.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Alexander-Fleming.',
      title: 'アレクサンダー・フレミング',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Synthetic_Production_of_Penicillin_TR1468.jpg/200px-Synthetic_Production_of_Penicillin_TR1468.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Guglielmo-Marconi',
      title: 'グリエルモ・マルコーニ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Guglielmo_Marconi.jpg/225px-Guglielmo_Marconi.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'James-Hutton',
      title: 'ジェームズ・ハットン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Hutton_James_portrait_Raeburn.jpg/225px-Hutton_James_portrait_Raeburn.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Max-Delbrück.',
      title: 'マックス・デルブリュック',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Maxdelbr%C3%BCck.jpg/225px-Maxdelbr%C3%BCck.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Walt-Disney',
      title: 'ウォルト・ディズニー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Walt_disney_portrait.jpg/250px-Walt_disney_portrait.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Edmund-Halley',
      title: 'エドモンド・ハレー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Edmund_Halley.gif/225px-Edmund_Halley.gif'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Georges-Cuvier',
      title: 'ジョルジュ・キュヴィエ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Bolton-cuvier.jpg/225px-Bolton-cuvier.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Aristotle',
      title: 'アリストテレス',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Aristotle_Altemps_Inv8575.jpg/200px-Aristotle_Altemps_Inv8575.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Roar-Amundsen.',
      title: 'ロアール・アムンセン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Nlc_amundsen.jpg/200px-Nlc_amundsen.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Heinrich-Schliemann.',
      title: 'ハインリヒ・シュリーマン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Heinrich_Schliemann.jpg/220px-Heinrich_Schliemann.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Takakazu-Seki',
      title: '関孝和',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Seki.jpeg/220px-Seki.jpeg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Max-Planck.',
      title: 'マックス・プランク',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Max_Planck_1933.jpg/225px-Max_Planck_1933.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Howard-Carter',
      title: 'ハワード・カーター',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Howard_carter.jpg/173px-Howard_carter.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Roberto-Bunsen',
      title: 'ロベルト・ブンゼン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Robert_Bunsen_02.jpg/200px-Robert_Bunsen_02.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Niels-Abel',
      title: 'ニールス・アーベル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Niels_Henrik_Abel.jpg/180px-Niels_Henrik_Abel.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Auguste-Picard',
      title: 'オーギュスト・ピカール',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Bundesarchiv_Bild_102-13738%2C_Auguste_Piccard.jpg/220px-Bundesarchiv_Bild_102-13738%2C_Auguste_Piccard.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Christopher-Columbus',
      title: 'クリストファー・コロンブス',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Ridolfo_Ghirlandaio_Columbus.jpg/200px-Ridolfo_Ghirlandaio_Columbus.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'George-Stevenson.',
      title: 'ジョージ・スチーブンソン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/GeorgeStephenson.PNG/220px-GeorgeStephenson.PNG'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Charles-Lindbergh',
      title: 'チャールズ・リンドバーグ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Col_Charles_Lindbergh.jpg/200px-Col_Charles_Lindbergh.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Johannes-Kepler',
      title: 'ヨハネス・ケプラー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Kepler.png/225px-Kepler.png'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Ferdinand-Magellan',
      title: 'フェルディナンド・マゼラン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Ferdinand_Magellan.jpg/180px-Ferdinand_Magellan.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Robert-Boyle',
      title: 'ロバート・ボイル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Robert_Boyle_0001.jpg/250px-Robert_Boyle_0001.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Sven-Hedin.',
      title: 'スヴェン・ヘディン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Sven_Hedin_01.jpg/250px-Sven_Hedin_01.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Heike-Kammerling-Onnes.',
      title: 'ヘイケ・カメルリング・オネス',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Kamerlingh_portret.jpg/200px-Kamerlingh_portret.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Johannes-Gutenberg.',
      title: 'ヨハネス・グーテンベルク',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Gutenberg.jpg/220px-Gutenberg.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Masatoshi-Okochi',
      title: '大河内正敏',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Masatoshi_Okochi.JPG/200px-Masatoshi_Okochi.JPG'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Erwin-Schrodinger.',
      title: 'エルヴィン・シュレーディンガー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Erwin_Schr%C3%B6dinger_%281933%29.jpg/225px-Erwin_Schr%C3%B6dinger_%281933%29.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Blaise-Pascal',
      title: 'ブレーズ・パスカル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Blaise_pascal.jpg/200px-Blaise_pascal.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Wendell-Stanley.',
      title: 'ウェンデル・スタンリー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Wendell_Meredith_Stanley.jpg/200px-Wendell_Meredith_Stanley.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Robert-Peary.',
      title: 'ロバート・ピアリー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/RobertPeary.jpg/200px-RobertPeary.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Werner-Heisenberg',
      title: 'ヴェルナー・ハイゼンベルク',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Bundesarchiv_Bild183-R57262%2C_Werner_Heisenberg.jpg/225px-Bundesarchiv_Bild183-R57262%2C_Werner_Heisenberg.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Amedeo-Avogadro.',
      title: 'アメデオ・アヴォガドロ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Amadeo_Avogadro.png/225px-Amadeo_Avogadro.png'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Karl-Benz',
      title: 'カール・ベンツ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Karl_Benz.jpg/220px-Karl_Benz.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Edward-Jenner.',
      title: 'エドワード・ジェンナー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Edward_Jenner.jpg/225px-Edward_Jenner.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Alessandro-Volta',
      title: 'アレッサンドロ・ボルタ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Alessandro_Volta.jpeg/225px-Alessandro_Volta.jpeg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Hata-Sahachiro',
      title: '秦佐八郎',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Sahachiro_Hata.jpg/180px-Sahachiro_Hata.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Philipp-Franz-von-Siebold',
      title: 'フィリップ・フランツ・フォン・シーボルト',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/%E3%82%B7%E3%83%BC%E3%83%9C%E3%83%AB%E3%83%88_%E5%B7%9D%E5%8E%9F%E6%85%B6%E8%B3%80%E7%AD%86.jpg/250px-%E3%82%B7%E3%83%BC%E3%83%9C%E3%83%AB%E3%83%88_%E5%B7%9D%E5%8E%9F%E6%85%B6%E8%B3%80%E7%AD%86.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'John-von-Neumann',
      title: 'ジョン・フォン・ノイマン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/JohnvonNeumann-LosAlamos.gif/225px-JohnvonNeumann-LosAlamos.gif'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Robert-Fulton',
      title: 'ロバート・フルトン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Fulton.jpg/200px-Fulton.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Edmund-Hillary',
      title: 'エドモンド・ヒラリー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Edmundhillarycropped.jpg/200px-Edmundhillarycropped.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Hugo-de-Vries',
      title: 'ユーゴー・ド・フリース',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Hugo_de_Vries_2.jpg/200px-Hugo_de_Vries_2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Wallace-Carothers.',
      title: 'ウォーレス・カロザース',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Wallace_Carothers%2C_in_the_lab.jpg/225px-Wallace_Carothers%2C_in_the_lab.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Thomas-Edison.',
      title: 'トーマス・エジソン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Thomas_Edison2.jpg/250px-Thomas_Edison2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Carl-von-Rinne',
      title: 'カール・フォン・リンネ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Carl_von_Linn%C3%A9.jpg/180px-Carl_von_Linn%C3%A9.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Henry-Cavendish',
      title: 'ヘンリー・キャヴェンディッシュ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Cavendish_Henry_signature.jpg/225px-Cavendish_Henry_signature.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Louis-Jacques-Mande-Daguerre',
      title: 'ルイ・ジャック・マンデ・ダゲール',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Louis_Daguerre.jpg/220px-Louis_Daguerre.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Robert-Koch',
      title: 'ローベルト・コッホ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Robert_Koch.jpg/225px-Robert_Koch.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Nicolaus-Copernicus',
      title: 'ニコラウス・コペルニクス',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Nikolaus_Kopernikus.jpg/225px-Nikolaus_Kopernikus.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Alfred-Nobel',
      title: 'アルフレッド・ノーベル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/AlfredNobel2.jpg/200px-AlfredNobel2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Albert-Michelson',
      title: 'アルバート・マイケルソン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Albert_Abraham_Michelson2.jpg/225px-Albert_Abraham_Michelson2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'George-Gamow',
      title: 'ジョージ・ガモフ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/1/1d/Bragg_lab1_1930_%28cropped%29.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Alexander-von-Humboldt',
      title: 'アレクサンダー・フォン・フンボルト',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/AvHumboldt.jpg/225px-AvHumboldt.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'René-Descartes',
      title: 'ルネ・デカルト',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Frans_Hals_-_Portret_van_Ren%C3%A9_Descartes.jpg/200px-Frans_Hals_-_Portret_van_Ren%C3%A9_Descartes.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'James-Prescott-Jules',
      title: 'ジェームズ・プレスコット・ジュール',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Joule_James_sitting.jpg/250px-Joule_James_sitting.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Himiko',
      title: '卑弥呼',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Himiko_Queen_of_Yamataikoku.jpg/400px-Himiko_Queen_of_Yamataikoku.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Yamato-Takel',
      title: 'ヤマトタケル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Yamato_Takeru%28bronze_statue%2COsaka%2901.jpg/250px-Yamato_Takeru%28bronze_statue%2COsaka%2901.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Jintoku-tenno',
      title: '仁徳天皇',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Nintoku-tenn%C5%8D_detail.jpg/190px-Nintoku-tenn%C5%8D_detail.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'soga-no-umako',
      title: '蘇我馬子',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Soga_no_Umako.jpg/240px-Soga_no_Umako.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Shotoku-Taishi',
      title: '聖徳太子',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Umayado_Miko.jpg/220px-Umayado_Miko.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Ono-no-Imoko',
      title: '小野妹子',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Grave_of_Onono_Imoko1.jpg/220px-Grave_of_Onono_Imoko1.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Suoga-Iruka',
      title: '蘇我入鹿',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Kamatari_and_Prince_Oe_Killing_the_Usurper_Iruka_LACMA_M.84.31.251.jpg/200px-Kamatari_and_Prince_Oe_Killing_the_Usurper_Iruka_LACMA_M.84.31.251.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Nakanoooe-no-oji',
      title: '中大兄皇子',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Emperor_Tenji.jpg/250px-Emperor_Tenji.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Leoš-Janacek',
      title: 'レオシュ・ヤナーチェク',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Leos_Janacek_relief.jpg/135px-Leos_Janacek_relief.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Emperor-Temmu',
      title: '天武天皇',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Emperor_Tenmu.jpg/300px-Emperor_Tenmu.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Fujiwara-no-Fuhito',
      title: '藤原不比等',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Fujiwara-Fuhito.jpg/230px-Fujiwara-Fuhito.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Emperor-Shomu',
      title: '聖武天皇',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Emperor_Shomu.jpg/250px-Emperor_Shomu.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'gyo-ki',
      title: '行基',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Gyouki_1.jpg/260px-Gyouki_1.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'ganjin',
      title: '鑑真',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Ganjin_wajyo_portrait.JPG/220px-Ganjin_wajyo_portrait.JPG'),
  ChatContent(
      posterUid: officialId,
      contentId: 'dokyo',
      title: '道鏡',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Signature_Manuscript_Dokyo_ACE763.JPG/120px-Signature_Manuscript_Dokyo_ACE763.JPG'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Emperor-Kammu',
      title: '桓武天皇',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Emperor_Kammu_large.jpg/225px-Emperor_Kammu_large.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Sakagami-Tamuramaro',
      title: '坂上田村麻呂',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Sakanoue_Tamuramaro_sw.jpg/250px-Sakanoue_Tamuramaro_sw.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'saityo',
      title: '最澄',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/%E6%9C%80%E6%BE%84%E5%83%8F_%E4%B8%80%E4%B9%97%E5%AF%BA%E8%94%B5_%E5%B9%B3%E5%AE%89%E6%99%82%E4%BB%A3.jpg/250px-%E6%9C%80%E6%BE%84%E5%83%8F_%E4%B8%80%E4%B9%97%E5%AF%BA%E8%94%B5_%E5%B9%B3%E5%AE%89%E6%99%82%E4%BB%A3.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Kukai',
      title: '空海',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/9/98/Kobo_Daishi_%28Taisanji_Matsuyama%29.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Fujiwara-no-Yoshifusa',
      title: '藤原良房',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Fujiwara_no_Yoshifusa.jpg/220px-Fujiwara_no_Yoshifusa.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Sugawara-no-Michizane',
      title: '菅原道真',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Sugawara_Michizane.jpg/200px-Sugawara_Michizane.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Taira--no-Masakado',
      title: '平将門',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Taira_no_Masakado_01.jpg/250px-Taira_no_Masakado_01.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Fujiwara-Junyu',
      title: '藤原純友',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Fujiwara_no_Sumitomo.jpg/200px-Fujiwara_no_Sumitomo.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'seisyo-nagon',
      title: '清少納言',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/6/6f/Sei_Shonagon2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'murasaki-shikibu',
      title: '紫式部',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Murasaki-Shikibu-composing-Genji-Monogatari.png/200px-Murasaki-Shikibu-composing-Genji-Monogatari.png'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Fujiwara-no-Michinaga',
      title: '藤原道長',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/f/f3/Fujiwaranomichinaga.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Fujiwara-no-Yorimichi',
      title: '藤原頼通',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Fujiwara_Yorimichi.JPG/200px-Fujiwara_Yorimichi.JPG'),
  ChatContent(
      posterUid: officialId,
      contentId: 'gosanjo-tenno',
      title: '後三条天皇',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Emperor_Gosanj%C5%8D.jpg/225px-Emperor_Gosanj%C5%8D.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Shirakawa-Emperor',
      title: '白河天皇',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Emperor_Shirakawa.jpg/250px-Emperor_Shirakawa.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Minamoto-no-Yoshie',
      title: '源義家',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Minamoto_no_Yoshiie.jpg/250px-Minamoto_no_Yoshiie.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Taira-no-Kiyomori',
      title: '平清盛',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Taira_no_Kiyomori%2CTenshiSekkanMiei.jpg/270px-Taira_no_Kiyomori%2CTenshiSekkanMiei.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Minamoto-no-Yoshitomo',
      title: '源義朝',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/%E5%85%83%E5%B9%B3%E6%B2%BB%E5%90%88%E6%88%A6%E6%BA%90%E7%BE%A9%E6%9C%9D%E7%99%BD%E6%B2%B3%E6%AE%BF%E5%A4%9C%E8%A8%8E%E4%B9%8B%E5%9B%B3.jpg/200px-%E5%85%83%E5%B9%B3%E6%B2%BB%E5%90%88%E6%88%A6%E6%BA%90%E7%BE%A9%E6%9C%9D%E7%99%BD%E6%B2%B3%E6%AE%BF%E5%A4%9C%E8%A8%8E%E4%B9%8B%E5%9B%B3.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'goshirakawa-tenno',
      title: '後白河天皇',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Emperor_Go-Shirakawa2.jpg/270px-Emperor_Go-Shirakawa2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Minamoto-Yoshitsune',
      title: '源義経',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Minamoto_no_Yoshitsune.jpg/250px-Minamoto_no_Yoshitsune.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Minamoto-no-Yoritomo',
      title: '源頼朝',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Minamoto_no_Yoritomo.jpg/250px-Minamoto_no_Yoritomo.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Hojo-Masako',
      title: '北条政子',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Hojo_Masako.jpg/200px-Hojo_Masako.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'gotoba-tenno',
      title: '後鳥羽天皇',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Emperor_Go-Toba.jpg/250px-Emperor_Go-Toba.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Hojo-Yasuji',
      title: '北条泰時',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/YASUTOKI_NISHIKI.PNG/250px-YASUTOKI_NISHIKI.PNG'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Hojo-Tokiyori',
      title: '北条時頼',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/H%C5%8Dj%C5%8D_Tokiyori.jpg/170px-H%C5%8Dj%C5%8D_Tokiyori.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Hojo-Tokimune',
      title: '北条時宗',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/H%C5%8Dj%C5%8D_Tokimune.jpg/200px-H%C5%8Dj%C5%8D_Tokimune.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'kubilai',
      title: 'クビライ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/YuanEmperorAlbumKhubilaiPortrait.jpg/250px-YuanEmperorAlbumKhubilaiPortrait.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'godaigo-tenno',
      title: '後醍醐天皇',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Emperor_Godaigo.jpg/250px-Emperor_Godaigo.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Kusunoki-Masanari',
      title: '楠木正成',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Kusunoki_Masashige.jpg/230px-Kusunoki_Masashige.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Nitta-Yoshisada',
      title: '新田義貞',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/%E6%96%B0%E7%94%B0%E7%BE%A9%E8%B2%9E%E5%85%AC%E8%82%96%E5%83%8F.jpg/250px-%E6%96%B0%E7%94%B0%E7%BE%A9%E8%B2%9E%E5%85%AC%E8%82%96%E5%83%8F.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Ashikaga-Takauji',
      title: '足利尊氏',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Ashikaga_Takauji_J%C5%8Ddo-ji.jpg/250px-Ashikaga_Takauji_J%C5%8Ddo-ji.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Ashikaga-Yoshimitsu',
      title: '足利義満',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Yoshimitsu_Ashikaga_cropped.jpg/250px-Yoshimitsu_Ashikaga_cropped.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Zeami',
      title: '世阿弥',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/2/28/Zo%27onna_Noh_Mask%2C_Edo_period%2C_18th_century%2C_wood_with_polychromy_-_Tokyo_National_Museum_-_DSC06166.JPG'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Ashikaga-Yoshimasa',
      title: '足利義政',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Ashikaga_Yoshimasa.jpg/260px-Ashikaga_Yoshimasa.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'sessyu',
      title: '雪舟',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Portrait_of_Sesshu.jpg/220px-Portrait_of_Sesshu.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Ikkyu-Soujun',
      title: '一休宗純',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/4/40/Portrait_of_Ikky%C5%AB_by_Bokusai.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Francisco-Xavier',
      title: 'フランシスコ・ザビエル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Franciscus_de_Xabier.jpg/250px-Franciscus_de_Xabier.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Houjou-Soun',
      title: '北条早雲',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Soun_Hojo_portrait.jpg/250px-Soun_Hojo_portrait.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Doso-Saito',
      title: '斎藤道三',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Saito-Dozan-2.jpg/230px-Saito-Dozan-2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Mori-Motoki',
      title: '毛利元就',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Mori_Motonari.jpg/250px-Mori_Motonari.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Takeda-Shingen',
      title: '武田信玄',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Takeda_Harunobu.jpg/250px-Takeda_Harunobu.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Kenshin-Uesugi',
      title: '上杉謙信',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Uesugi_Kenshin_Portrait_from_Uesugi_Shrine.png/250px-Uesugi_Kenshin_Portrait_from_Uesugi_Shrine.png'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Oda-Nobunaga',
      title: '織田信長',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Oda-Nobunaga.jpg/250px-Oda-Nobunaga.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Ashikaga-Yoshiaki',
      title: '足利義昭',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Ashikaga_Yoshiaki.jpg/260px-Ashikaga_Yoshiaki.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Akechi-Mitsuhide',
      title: '明智光秀',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Akechi_Mitsuhide2.jpg/250px-Akechi_Mitsuhide2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Toyotomi-Hideyoshi',
      title: '豊臣秀吉',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Toyotomi_Hideyoshi_c1598_Kodai-ji_Temple.png/250px-Toyotomi_Hideyoshi_c1598_Kodai-ji_Temple.png'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Senriku-Rikyuu',
      title: '千利休',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Sen_no_Rikyu_JPN.jpg/200px-Sen_no_Rikyu_JPN.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Ishida-Mitsunari',
      title: '石田三成',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Ishida_Mitsunari.jpg/250px-Ishida_Mitsunari.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Hideyori-Toyotomi-Hideyori',
      title: '豊臣秀頼',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Hideyori_Toyotomi.jpg/250px-Hideyori_Toyotomi.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Date-Masamune',
      title: '伊達政宗',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Date_Masamune02.jpg/280px-Date_Masamune02.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Tokugawa-Ieyasu',
      title: '徳川家康',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Tokugawa_Ieyasu2.JPG/270px-Tokugawa_Ieyasu2.JPG'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Tokugawa-Iemitsu',
      title: '徳川家光',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Iemitu.jpg/250px-Iemitu.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Shiro-Amakusa',
      title: '天草四郎',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Amakusa_Shiro.jpg/220px-Amakusa_Shiro.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Tsunayoshi-Tokugawa',
      title: '徳川綱吉',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Tsunyaoshi.jpg/250px-Tsunyaoshi.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Arai-Hakuseki',
      title: '新井白石',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Arai_Hakuseki_-_Japanischer_Gelehrter.jpg/250px-Arai_Hakuseki_-_Japanischer_Gelehrter.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Yoshimune-Tokugawa',
      title: '徳川吉宗',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Tokugawa_Yoshimune.jpg/260px-Tokugawa_Yoshimune.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Ooka-Tadasama',
      title: '大岡忠相',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Oooka_tadasuke.jpg/250px-Oooka_tadasuke.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Motoori-Nobunaga',
      title: '本居宣長',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Motoori_Norinaga_self_portrait.jpg/230px-Motoori_Norinaga_self_portrait.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Tanuma-Okitsugu',
      title: '田沼意次',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Tanuma_Okitsugu2.jpg/250px-Tanuma_Okitsugu2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Matsudaira-Sadanobu',
      title: '松平定信',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Matsudaira_Sadanobu.jpg/250px-Matsudaira_Sadanobu.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Heihachiro-Oshio',
      title: '大塩平八郎',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Oshio_Heihachiro.jpg/250px-Oshio_Heihachiro.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Tadakuni-Mizuno',
      title: '水野忠邦',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Mizuno_Tadakuni.jpg/300px-Mizuno_Tadakuni.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Matthew-Perry',
      title: 'マシュー・ペリー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Commodore_Matthew_Calbraith_Perry.png/250px-Commodore_Matthew_Calbraith_Perry.png'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Ii-Naosuke',
      title: '井伊直弼',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Ii_Naosuke.jpg/250px-Ii_Naosuke.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Yoshida-Shoi',
      title: '吉田松陰',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Yoshida_Shoin2.jpg/250px-Yoshida_Shoin2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Tokachi-Kaisyu',
      title: '勝海舟',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Kaishu_Katsu_2.jpg/200px-Kaishu_Katsu_2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Shimazu-Nariakira',
      title: '島津斉彬',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Nariakira_Shimazu.png/200px-Nariakira_Shimazu.png'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Sakamoto-Ryoma',
      title: '坂本龍馬',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Sakamoto_Ryoma.jpg/250px-Sakamoto_Ryoma.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Keiki-Tokugawa',
      title: '徳川慶喜',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/YoshinobuTokugawa.jpg/200px-YoshinobuTokugawa.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Emperor-Meiji',
      title: '明治天皇',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Emperor_Meiji_in_1873.jpg/230px-Emperor_Meiji_in_1873.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Okubo-Toshimichi',
      title: '大久保利通',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Toshimichi_Okubo_4.jpg/200px-Toshimichi_Okubo_4.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Kido-Kouyoshi',
      title: '木戸孝允',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Takayoshi_Kido_suit.jpg/500px-Takayoshi_Kido_suit.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Saigo-Takamori',
      title: '西郷隆盛',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Saigo_Takamori_Portrait_by_Ishikawa_Shizumasa.jpg/250px-Saigo_Takamori_Portrait_by_Ishikawa_Shizumasa.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Tomomi-Iwakura',
      title: '岩倉具視',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Tomomi_Iwakura_3.jpg/220px-Tomomi_Iwakura_3.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Hirobumi-Ito',
      title: '伊藤博文',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/IT%C5%8C_Hirobumi.jpg/220px-IT%C5%8C_Hirobumi.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Fukuzawa-Yukichi',
      title: '福沢諭吉',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Yukichi_Fukuzawa_1891.jpg/200px-Yukichi_Fukuzawa_1891.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Itagaki-Tasuke',
      title: '板垣退助',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/ITAGAKI_Taisuke.jpg/220px-ITAGAKI_Taisuke.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Shigenobu-Okuma',
      title: '大隈重信',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Shigenobu_Okuma_5.jpg/220px-Shigenobu_Okuma_5.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Mutsu-Munemitsu',
      title: '陸奥宗光',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Mutsu_Munemitsu.jpg/200px-Mutsu_Munemitsu.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Kotaro-Komura',
      title: '小村寿太郎',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Komura_Jutaro.jpg/200px-Komura_Jutaro.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Heihachiro-Togo',
      title: '東郷平八郎',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/T%C5%8Dg%C5%8D_Heihachir%C5%8D.jpg/260px-T%C5%8Dg%C5%8D_Heihachir%C5%8D.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Kiyoshi-Shiga',
      title: '志賀潔',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Kiyoshi_Shiga.jpg/220px-Kiyoshi_Shiga.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Tanaka-Shozo',
      title: '田中正造',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Tanaka_Shozo.jpg/200px-Tanaka_Shozo.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Saionji-Kinmoti',
      title: '西園寺公望',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Kinmochi_Saionji_2.jpg/220px-Kinmochi_Saionji_2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Hideyo-Noguchi',
      title: '野口英世',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Noguchi_Hideyo.jpg/225px-Noguchi_Hideyo.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Yukio-Ozaki',
      title: '尾崎行雄',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Yukio_Ozaki.jpg/250px-Yukio_Ozaki.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'original-salutation',
      title: '原敬',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Takashi_Hara_formal.jpg/220px-Takashi_Hara_formal.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Takeshi-Inuyo',
      title: '犬養毅',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Inukai_Tsuyoshi.jpg/220px-Inukai_Tsuyoshi.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Isoroku-Yamamoto',
      title: '山本五十六',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Portrait_of_Yamamoto_Isoroku.jpg/255px-Portrait_of_Yamamoto_Isoroku.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Douglas-MacArthur.',
      title: 'ダグラス・マッカーサー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/MacArthur_Manila.jpg/240px-MacArthur_Manila.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Shigeru-Yoshida',
      title: '吉田茂',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Shigeru_Yoshida_suit.jpg/200px-Shigeru_Yoshida_suit.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'George-Barkley.',
      title: 'ジョージ・バークリー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/George_Berkeley_by_John_Smibert.jpg/200px-George_Berkeley_by_John_Smibert.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Benjamin-Franklin.',
      title: 'ベンジャミン・フランクリン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/BenFranklinDuplessis.jpg/200px-BenFranklinDuplessis.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Helen-Keller.',
      title: 'ヘレン・ケラー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Helen_KellerA.jpg/220px-Helen_KellerA.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'John-F-Kennedy',
      title: 'ジョン・F・ケネディ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/John_F._Kennedy%2C_White_House_color_photo_portrait.jpg/220px-John_F._Kennedy%2C_White_House_color_photo_portrait.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Martin-Luther-King-Jr',
      title: 'マーティン・ルーサー・キング・ジュニア',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Martin_Luther_King_Jr_NYWTS.jpg/300px-Martin_Luther_King_Jr_NYWTS.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Franklin-D-Roosevelt.',
      title: 'フランクリン・ルーズベルト',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/FDR_1944_Color_Portrait.jpg/250px-FDR_1944_Color_Portrait.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Che-Guevara',
      title: 'チェ・ゲバラ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/CheHigh.jpg/200px-CheHigh.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Victoria',
      title: 'ヴィクトリア (イギリス女王)',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Queen_Victoria_-Golden_Jubilee_-3a_cropped.JPG/200px-Queen_Victoria_-Golden_Jubilee_-3a_cropped.JPG'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Florence-Nightingale',
      title: 'フローレンス・ナイチンゲール',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Florence_Nightingale_CDV_by_H_Lenthall.jpg/220px-Florence_Nightingale_CDV_by_H_Lenthall.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'William-Shakespeare.',
      title: 'ウィリアム・シェイクスピア',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/CHANDOS3.jpg/200px-CHANDOS3.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Winston-Churchill',
      title: 'ウィンストン・チャーチル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Sir_Winston_Churchill_-_19086236948.jpg/400px-Sir_Winston_Churchill_-_19086236948.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Charles-Chaplin.',
      title: 'チャールズ・チャップリン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Charlie_Chaplin_portrait.jpg/220px-Charlie_Chaplin_portrait.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Arthur-Conan-Doyle',
      title: 'アーサー・コナン・ドイル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Conan_doyle.jpg/250px-Conan_doyle.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Adam-Smith',
      title: 'アダム・スミス',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/AdamSmith.jpg/200px-AdamSmith.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Michelangelo-Buonarroti',
      title: 'ミケランジェロ・ブオナローティ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Miguel_%C3%81ngel%2C_por_Daniele_da_Volterra_%28detalle%29.jpg/220px-Miguel_%C3%81ngel%2C_por_Daniele_da_Volterra_%28detalle%29.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Raffaello-Santi',
      title: 'ラファエロ・サンティ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Raffaello_Sanzio.jpg/220px-Raffaello_Sanzio.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Sandro-Botticelli',
      title: 'サンドロ・ボッティチェッリ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Sandro_Botticelli_083.jpg/220px-Sandro_Botticelli_083.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Benito-Mussolini',
      title: 'ベニート・ムッソリーニ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Mussolini_biografia.jpg/220px-Mussolini_biografia.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Dante-Alighieri.',
      title: 'ダンテ・アリギエーリ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Portrait_de_Dante.jpg/200px-Portrait_de_Dante.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Lorenzo-de-Medici',
      title: 'ロレンツォ・デ・メディチ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Lorenzo_de%27_Medici-ritratto.jpg/400px-Lorenzo_de%27_Medici-ritratto.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Pietro-Mascagni',
      title: 'ピエトロ・マスカーニ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Pietro_Mascagni_2.jpg/220px-Pietro_Mascagni_2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Tintoretto',
      title: 'ティントレット',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Tintorettoselfportrait.jpg/250px-Tintorettoselfportrait.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Michelangelo-Merisi-da-Caravaggio',
      title: 'ミケランジェロ・メリージ・ダ・カラヴァッジオ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Bild-Ottavio_Leoni%2C_Caravaggio.jpg/200px-Bild-Ottavio_Leoni%2C_Caravaggio.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Filippo-Lippi',
      title: 'フィリッポ・リッピ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Fra_Filippo_Lippi_007.1.jpg/220px-Fra_Filippo_Lippi_007.1.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Girolamo-Savonarola',
      title: 'ジロラモ・サヴォナローラ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/GirolamoSavonarola.jpg/200px-GirolamoSavonarola.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Paolo-Veronese',
      title: 'パオロ・ヴェロネーゼ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Paolo_Veronese%2C_avtoportret.jpg/220px-Paolo_Veronese%2C_avtoportret.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Giorgio-Vasari',
      title: 'ジョルジョ・ヴァザーリ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Giorgio_Vasari_Selbstportr%C3%A4t.jpg/220px-Giorgio_Vasari_Selbstportr%C3%A4t.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Moses',
      title: 'モーセ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Moses_%28Michaelangelo_-_San_Pietro_in_Vincoli_-_Rome%29.jpg/250px-Moses_%28Michaelangelo_-_San_Pietro_in_Vincoli_-_Rome%29.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Richard-I',
      title: 'リチャード1世 (イングランド王)',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/4/49/Richard_coeurdelion_g.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Elizabeth-I',
      title: 'エリザベス1世 (イングランド女王)',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Elizabeth1England.jpg/250px-Elizabeth1England.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Oliver-Cromwell',
      title: 'オリバー・クロムウェル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Oliver_Cromwell_by_Samuel_Cooper.jpg/220px-Oliver_Cromwell_by_Samuel_Cooper.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'King-Ashoka',
      title: 'アショーカ王',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Indian_relief_from_Amaravati%2C_Guntur._Preserved_in_Guimet_Museum.jpg/200px-Indian_relief_from_Amaravati%2C_Guntur._Preserved_in_Guimet_Museum.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Mahatma-Gandhi',
      title: 'マハトマ・ガンディー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Portrait_Gandhi.jpg/250px-Portrait_Gandhi.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Shakyamuni',
      title: '釈迦',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Buddha_in_Sarnath_Museum_%28Dhammajak_Mutra%29.jpg/240px-Buddha_in_Sarnath_Museum_%28Dhammajak_Mutra%29.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Marco-Polo',
      title: 'マルコ・ポーロ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Marco_Polo_portrait.jpg/220px-Marco_Polo_portrait.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Ramses-II',
      title: 'ラムセス2世',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/RamsesIIEgypt.jpg/220px-RamsesIIEgypt.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Salahuddin',
      title: 'サラーフッディーン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Portrait_of_Saladin_%28before_A.D._1185%3B_short%29.jpg/225px-Portrait_of_Saladin_%28before_A.D._1185%3B_short%29.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'kufu',
      title: 'クフ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Kairo_Museum_Statuette_Cheops_03_%28cropped%29.jpg/220px-Kairo_Museum_Statuette_Cheops_03_%28cropped%29.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Eliezabeth',
      title: 'エリーザベト (オーストリア皇后)',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Erzsebet_kiralyne_photo_1867.jpg/200px-Erzsebet_kiralyne_photo_1867.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Sigmund-Freud.',
      title: 'ジークムント・フロイト',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Sigmund_Freud_LIFE.jpg/225px-Sigmund_Freud_LIFE.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Maria-Theresa',
      title: 'マリア・テレジア',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Kaiserin_Maria_Theresia_%28HRR%29.jpg/220px-Kaiserin_Maria_Theresia_%28HRR%29.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Franz-Joseph-Haydn',
      title: 'フランツ・ヨーゼフ・ハイドン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Haydn_portrait_by_Thomas_Hardy_%28small%29.jpg/220px-Haydn_portrait_by_Thomas_Hardy_%28small%29.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Wolfgang-Amadeus-Mozart',
      title: 'ヴォルフガング・アマデウス・モーツァルト',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Wolfgang-amadeus-mozart_1.jpg/200px-Wolfgang-amadeus-mozart_1.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Anton-Bruckner.',
      title: 'アントン・ブルックナー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Bruckner_final_years.jpg/220px-Bruckner_final_years.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Johann-Strauss-II',
      title: 'ヨハン・シュトラウス2世',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Johann_Strauss_II_1890.jpg/220px-Johann_Strauss_II_1890.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Vincent-van-Gogh',
      title: 'フィンセント・ファン・ゴッホ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/VanGogh_1887_Selbstbildnis.jpg/250px-VanGogh_1887_Selbstbildnis.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Barouf-de-Spinoza.',
      title: 'バールーフ・デ・スピノザ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Spinoza.jpg/200px-Spinoza.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Suleiman-I',
      title: 'スレイマン1世',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/EmperorSuleiman.jpg/200px-EmperorSuleiman.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Hannibal',
      title: 'ハンニバル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Hannibal_Slodtz_Louvre_MR2093.jpg/200px-Hannibal_Slodtz_Louvre_MR2093.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Alexander-III',
      title: 'アレクサンドロス3世',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Istanbul_-_Museo_archeol._-_Alessandro_Magno_%28firmata_Menas%29_-_sec._III_a.C._-_da_Magnesia_-_Foto_G._Dall%27Orto_28-5-2006_b-n.jpg/200px-Istanbul_-_Museo_archeol._-_Alessandro_Magno_%28firmata_Menas%29_-_sec._III_a.C._-_da_Magnesia_-_Foto_G._Dall%27Orto_28-5-2006_b-n.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Felipe-II',
      title: 'フェリペ2世 (スペイン王)',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/King_PhilipII_of_Spain.jpg/200px-King_PhilipII_of_Spain.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Francisco-Pizarro',
      title: 'フランシスコ・ピサロ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Pizarro.jpg/250px-Pizarro.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Hernan-Cortez.',
      title: 'エルナン・コルテス',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Retrato_de_Hern%C3%A1n_Cort%C3%A9s.jpg/220px-Retrato_de_Hern%C3%A1n_Cort%C3%A9s.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Francisco-de-Goya',
      title: 'フランシスコ・デ・ゴヤ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Vicente_L%C3%B3pez_Porta%C3%B1a_-_el_pintor_Francisco_de_Goya.jpg/220px-Vicente_L%C3%B3pez_Porta%C3%B1a_-_el_pintor_Francisco_de_Goya.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Pablo-Picasso',
      title: 'パブロ・ピカソ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Pablo_picasso_1.jpg/230px-Pablo_picasso_1.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Christina',
      title: 'クリスティーナ (スウェーデン女王)',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/David_Beck_-_Christina%2C_Queen_of_Sweden_1644-1654_-_Google_Art_Project.jpg/400px-David_Beck_-_Christina%2C_Queen_of_Sweden_1644-1654_-_Google_Art_Project.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Carl-Zumberg',
      title: 'カール・ツンベルク',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/f/f5/Carl_Peter_Thunberg.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Vladimir-Lenin',
      title: 'ウラジーミル・レーニン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Vladimir_Lenin.jpg/200px-Vladimir_Lenin.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Joseph-Stalin',
      title: 'ヨシフ・スターリン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Josef_Stalin_-_NARA_-_198797.jpg/220px-Josef_Stalin_-_NARA_-_198797.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Yuriy-Gagarin',
      title: 'ユーリイ・ガガーリン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/c/cc/Gagarin_in_Sweden.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Kanu',
      title: '関羽',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Guanyu.jpg/200px-Guanyu.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Zhang-Liang',
      title: '張良',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Zhang_Liang.jpg/220px-Zhang_Liang.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Cao-Cao',
      title: '曹操',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Cao_Cao_scth.jpg/220px-Cao_Cao_scth.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Liu-Bei',
      title: '劉備',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Liu_Bei_Tang.jpg/170px-Liu_Bei_Tang.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Sun-Quan',
      title: '孫権',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Sun_Quan_Tang.jpg/240px-Sun_Quan_Tang.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Genjo',
      title: '玄奘',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Xuanzang_w.jpg/150px-Xuanzang_w.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Yi-Paikou',
      title: '李白',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Libai_touxiang.jpg/200px-Libai_touxiang.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Shiba-Sangon',
      title: '司馬遷',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Si_maqian.jpg/220px-Si_maqian.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Confucius',
      title: '孔子',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/2/2d/Confucius_02.png'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Qin-Shi-Huang',
      title: '秦始皇',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Qinshihuang.jpg/320px-Qinshihuang.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Zhu-Yuanzhang.',
      title: '朱元璋',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/%E6%98%8E%E5%A4%AA%E7%A5%96%E7%94%BB%E5%83%8F.jpg/200px-%E6%98%8E%E5%A4%AA%E7%A5%96%E7%94%BB%E5%83%8F.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'To-Fu',
      title: '杜甫',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Du_Fu.jpg/250px-Du_Fu.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Sun-Yat-sen',
      title: '孫文',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Sun_Yat-sen_2.jpg/400px-Sun_Yat-sen_2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Mao-Zedong',
      title: '毛沢東',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Mao_Zedong_1959.jpg/220px-Mao_Zedong_1959.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Richard-Wagner',
      title: 'リヒャルト・ワーグナー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/RichardWagner.jpg/220px-RichardWagner.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Martin-Luther',
      title: 'マルティン・ルター',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Lucas_Cranach_%28I%29_workshop_-_Martin_Luther_%28Uffizi%29.jpg/200px-Lucas_Cranach_%28I%29_workshop_-_Martin_Luther_%28Uffizi%29.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Johann-Sebastian-Bach',
      title: 'ヨハン・ゼバスティアン・バッハ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Johann_Sebastian_Bach.png/200px-Johann_Sebastian_Bach.png'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Ludwig-van-Beethoven',
      title: 'ルートヴィヒ・ヴァン・ベートーヴェン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Beethoven.jpg/200px-Beethoven.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Karl-Marx',
      title: 'カール・マルクス',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Marx7.jpg/200px-Marx7.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Immanuel-Canto.',
      title: 'イマヌエル・カント',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Kant_gemaelde_1.jpg/250px-Kant_gemaelde_1.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Georg-Wilhelm-Friedrich-Hegel',
      title: 'ゲオルク・ヴィルヘルム・フリードリヒ・ヘーゲル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Hegel_portrait_by_Schlesinger_1831.jpg/200px-Hegel_portrait_by_Schlesinger_1831.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Friedrich-Nietzsche',
      title: 'フリードリヒ・ニーチェ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Nietzsche1882.jpg/200px-Nietzsche1882.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Artur-Schopenhauer',
      title: 'アルトゥル・ショーペンハウアー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Arthur_Schopenhauer_Portrait_by_Ludwig_Sigismund_Ruhl_1815.jpeg/240px-Arthur_Schopenhauer_Portrait_by_Ludwig_Sigismund_Ruhl_1815.jpeg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Engelbert-Kempel',
      title: 'エンゲルベルト・ケンペル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Engelbert_Kaempfer.jpg/115px-Engelbert_Kaempfer.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Anne-Frank',
      title: 'アンネ・フランク',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/AnneFrankSchoolPhoto.jpg/220px-AnneFrankSchoolPhoto.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Felix-Mendelssohn',
      title: 'フェリックス・メンデルスゾーン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Mendelssohn_Bartholdy.jpg/220px-Mendelssohn_Bartholdy.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Carl-Maria-von-Weber',
      title: 'カール・マリア・フォン・ウェーバー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Carl_Maria_von_Weber.jpg/220px-Carl_Maria_von_Weber.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Justinian-I',
      title: 'ユスティニアヌス1世',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Meister_von_San_Vitale_in_Ravenna.jpg/200px-Meister_von_San_Vitale_in_Ravenna.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Gaius-Julius-Caesar',
      title: 'ガイウス・ユリウス・カエサル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Julius_Caesar_Coustou_Louvre_MR1798.jpg/500px-Julius_Caesar_Coustou_Louvre_MR1798.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Jean-Sibelius',
      title: 'ジャン・シベリウス',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Jean_Sibelius%2C_1913.jpg/220px-Jean_Sibelius%2C_1913.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: "Jeanne-d-Arc",
      title: 'ジャンヌ・ダルク',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Joan_of_Arc_miniature_graded.jpg/250px-Joan_of_Arc_miniature_graded.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Charles-VII',
      title: 'シャルル7世 (フランス王)',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/KarlVII.jpg/200px-KarlVII.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Louis-XIV',
      title: 'ルイ14世 (フランス王)',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Louis_XIV_of_France.jpg/200px-Louis_XIV_of_France.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Marie-Antoinette.',
      title: 'マリー・アントワネット',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Vig%C3%A9e-Lebrun_Marie_Antoinette_1783.jpg/200px-Vig%C3%A9e-Lebrun_Marie_Antoinette_1783.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Napoleon-Bonaparte.',
      title: 'ナポレオン・ボナパルト',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Fran%C3%A7ois_G%C3%A9rard_-_Napoleon_I_001.JPG/200px-Fran%C3%A7ois_G%C3%A9rard_-_Napoleon_I_001.JPG'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Jean-Jacques-Rousseau',
      title: 'ジャン＝ジャック・ルソー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Jean-Jacques_Rousseau_%28painted_portrait%29.jpg/200px-Jean-Jacques_Rousseau_%28painted_portrait%29.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Coco-Chanel',
      title: 'ココ・シャネル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Coco_Chanel_in_Los_Angeles%2C_1931_%28cropped%29.jpg/180px-Coco_Chanel_in_Los_Angeles%2C_1931_%28cropped%29.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Claude-Debussy',
      title: 'クロード・ドビュッシー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Claude_Debussy_ca_1908%2C_foto_av_F%C3%A9lix_Nadar.jpg/220px-Claude_Debussy_ca_1908%2C_foto_av_F%C3%A9lix_Nadar.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Georges-Bizet',
      title: 'ジョルジュ・ビゼー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Georges_bizet.jpg/220px-Georges_bizet.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Ector-Berlioz.',
      title: 'エクトル・ベルリオーズ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Hector_berlioz.jpg/220px-Hector_berlioz.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Jules-Massenet',
      title: 'ジュール・マスネ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Jules_massenet.jpg/220px-Jules_massenet.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Eric-Satie',
      title: 'エリック・サティ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Ericsatie.jpg/220px-Ericsatie.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Gabriel-Foret',
      title: 'ガブリエル・フォーレ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Gabriel_Faur%C3%A9_Paul_Nadar_1905.JPG/220px-Gabriel_Faur%C3%A9_Paul_Nadar_1905.JPG'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Henri-Bergson',
      title: 'アンリ・ベルクソン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Henri_Bergson.jpg/200px-Henri_Bergson.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Maximilian-Robespierre',
      title: 'マクシミリアン・ロベスピエール',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Robespierre.jpg/400px-Robespierre.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Maurice-Ravel',
      title: 'モーリス・ラヴェル',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Maurice_Ravel_1925.jpg/220px-Maurice_Ravel_1925.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Frederic-Chopin',
      title: 'フレデリック・ショパン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Frederic_Chopin_photo.jpeg/200px-Frederic_Chopin_photo.jpeg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Tekla-Badajewska',
      title: 'テクラ・バダジェフスカ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/B%C4%85darzewska_Gebet_einer_Jungfrau.jpg/440px-B%C4%85darzewska_Gebet_einer_Jungfrau.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Prince-Enrique-Voyage',
      title: 'エンリケ航海王子',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Henry_the_Navigator1.jpg/200px-Henry_the_Navigator1.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Friedrich-II',
      title: 'フリードリヒ2世 (神聖ローマ皇帝)',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Frederick_II_and_eagle.jpg/200px-Frederick_II_and_eagle.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Mother-Teresa',
      title: 'マザー・テレサ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/MotherTeresa_090.jpg/200px-MotherTeresa_090.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Fyodor-Dostoevsky.',
      title: 'フョードル・ドストエフスキー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Dostoevsky.jpg/200px-Dostoevsky.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Lev-Tolstoy.',
      title: 'レフ・トルストイ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/LNTolstoy.jpg/200px-LNTolstoy.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Yekaterina-II',
      title: 'エカチェリーナ2世 (ロシア皇帝)',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Catherine_II_by_J.B.Lampi_%281780s%2C_Kunsthistorisches_Museum%29.jpg/200px-Catherine_II_by_J.B.Lampi_%281780s%2C_Kunsthistorisches_Museum%29.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Ivan-IV',
      title: 'イヴァン4世',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Ivan_grozny_frame.jpg/200px-Ivan_grozny_frame.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Peter-I',
      title: 'ピョートル1世 (ロシア皇帝)',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Peter_der-Grosse_1838.jpg/250px-Peter_der-Grosse_1838.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Pyotr-Tchaikovsky',
      title: 'ピョートル・チャイコフスキー',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Tchaikowsky.jpg/200px-Tchaikowsky.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Karl-the-Great',
      title: 'カール大帝',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/D%C3%BCrer_karl_der_grosse.jpg/200px-D%C3%BCrer_karl_der_grosse.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Friedrich-II',
      title: 'フリードリヒ2世 (プロイセン王)',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Friedrich2_jung.jpg/200px-Friedrich2_jung.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Heinrich-IV',
      title: 'ハインリヒ4世 (神聖ローマ皇帝)',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Heinrich_4_g.jpg/225px-Heinrich_4_g.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Innocentius-III',
      title: 'インノケンティウス3世 (ローマ教皇)',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Innozenz3.jpg/150px-Innozenz3.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Augustus',
      title: 'アウグストゥス',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Statue-Augustus.jpg/200px-Statue-Augustus.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Claudius-Ptolemy.',
      title: 'クラウディオス・プトレマイオス',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/PSM_V78_D326_Ptolemy.png/220px-PSM_V78_D326_Ptolemy.png'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Socrates',
      title: 'ソクラテス',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Socrate_du_Louvre.jpg/200px-Socrate_du_Louvre.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Plato',
      title: 'プラトン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Plato.png/200px-Plato.png'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Eratosthenes',
      title: 'エラトステネス',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Eratosthenes.jpg/200px-Eratosthenes.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Pericles',
      title: 'ペリクレス',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Pericles_Pio-Clementino_Inv269_n2.jpg/200px-Pericles_Pio-Clementino_Inv269_n2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'acquenaten',
      title: 'アクエンアテン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/GD-EG-Caire-Mus%C3%A9e061.JPG/220px-GD-EG-Caire-Mus%C3%A9e061.JPG'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Tutankamen',
      title: 'ツタンカーメン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Tutanchamun_Maske.jpg/220px-Tutanchamun_Maske.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'David',
      title: 'ダビデ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/David_SM_Maggiore.jpg/200px-David_SM_Maggiore.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'hammurabi',
      title: 'ハンムラビ',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Milkau_Oberer_Teil_der_Stele_mit_dem_Text_von_Hammurapis_Gesetzescode_369-2.jpg/200px-Milkau_Oberer_Teil_der_Stele_mit_dem_Text_von_Hammurapis_Gesetzescode_369-2.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Shah-Jahan',
      title: 'シャー・ジャハーン',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Shah_Jahan_of_Mughal_empire.jpg/200px-Shah_Jahan_of_Mughal_empire.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Cleopatra-VII',
      title: 'クレオパトラ7世',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Kleopatra-VII.-Altes-Museum-Berlin1.jpg/220px-Kleopatra-VII.-Altes-Museum-Berlin1.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Zhang-Fei',
      title: '張飛',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/ZhangFei.jpg/180px-ZhangFei.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Zhao-Yun',
      title: '趙雲',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/ZhaoYun.jpg/200px-ZhaoYun.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'genso',
      title: '玄宗',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Tang_XianZong.jpg/340px-Tang_XianZong.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'HanXin',
      title: '韓信',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/H%C3%A1n_X%C3%ACn.jpg/200px-H%C3%A1n_X%C3%ACn.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Kobu-tei',
      title: '光武帝',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Han_Guangwu_Di.jpg/200px-Han_Guangwu_Di.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'kouu',
      title: '項羽',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Xiang_Yu.jpg/220px-Xiang_Yu.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Liu-hou',
      title: '劉邦',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Hangaozu.jpg/170px-Hangaozu.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'dreary',
      title: '蕭何',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Xiao_he.jpg/200px-Xiao_he.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'syokaturyo',
      title: '諸葛亮',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/%E8%9C%80%E6%B1%89%E4%B8%9E%E7%9B%B8%E5%BF%A0%E6%AD%A6%E4%BE%AF%E8%AF%B8%E8%91%9B%E4%BA%AE.jpg/220px-%E8%9C%80%E6%B1%89%E4%B8%9E%E7%9B%B8%E5%BF%A0%E6%AD%A6%E4%BE%AF%E8%AF%B8%E8%91%9B%E4%BA%AE.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Sokuten-bukou',
      title: '則天武后',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/%E6%AD%A6%E5%88%99%E5%A4%A9%E7%94%BB%E5%83%8F.jpg/170px-%E6%AD%A6%E5%88%99%E5%A4%A9%E7%94%BB%E5%83%8F.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: "youte",
      title: '煬帝',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Sui_Yangdi_Tang.jpg/170px-Sui_Yangdi_Tang.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'youkihi',
      title: '楊貴妃',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/%E4%B8%8A%E9%A9%AC%E5%9B%BE.jpg/200px-%E4%B8%8A%E9%A9%AC%E5%9B%BE.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'hugi',
      title: '溥儀',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Xuantong.jpg/300px-Xuantong.jpg'),
  ChatContent(
      posterUid: officialId,
      contentId: 'Otto-von-Bismarck',
      title: 'オットー・フォン・ビスマルク',
      imageValue:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Bundesarchiv_Bild_146-2005-0057%2C_Otto_von_Bismarck.jpg/400px-Bundesarchiv_Bild_146-2005-0057%2C_Otto_von_Bismarck.jpg'),
];
