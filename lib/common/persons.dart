import 'package:great_talk/model/chat_user/chat_user.dart';

const String chatGPTId = "chatGPT";
const String wolframId = "wolfram";
// 現在のユーザーを定義.
final personIds = initialPeople.map((e) => e.uid).toList();
final proIds = proPeople.map((e) => e.uid).toList();
final List<ChatUser> initialPeople = [
  ...ai,
  ...greatPeople,
  ...proPeople,
];
const ai = [
  ChatUser(
      uid: chatGPTId,
      userName: 'なんでもAI',
      imageUrl:
          'https://pbs.twimg.com/media/FqNXz8saAAEdaXz?format=jpg&name=medium'),
  ChatUser(
      uid: wolframId,
      userName: '数学の先生',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/29/14/49/cube-1780775__480.jpg'),
];
const proPeople = [
  ChatUser(
      uid: 'human-resources',
      userName: '人事の専門家',
      metadata: {
        'description': '組織の人的資源を最大限に活用するための戦略を策定することを専門とする人',
      },
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/11/02/14/27/model-2911332__480.jpg'),
  ChatUser(
      uid: 'chef',
      userName: 'シェフ',
      metadata: {'description': '料理の専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1654922207993-2952fec328ae?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2hlZnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60'),
  ChatUser(
      uid: 'patissier',
      userName: 'パティシエ',
      metadata: {'description': 'お菓子の専門家'},
      imageUrl:
          "https://images.unsplash.com/photo-1519733870-f96bef9bc85f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8cGF0aXNzaWVyfGVufDB8fHx8MTY3OTQwMDk3MQ&ixlib=rb-4.0.3&q=80&w=400"),
  ChatUser(
      uid: 'counselor',
      userName: '心理カウンセラー',
      metadata: {'description': '心理的問題について相談に乗る専門家'},
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/03/26/21/54/yoga-2176668__480.jpg'),
  ChatUser(
      uid: 'doctor',
      userName: '医師',
      metadata: {'description': '病気の診断や治療を行う専門家'},
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/03/14/03/20/woman-2141808__480.jpg'),
  ChatUser(
      uid: 'lawyer',
      userName: '弁護士',
      metadata: {'description': '法律の専門家'},
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/04/12/16/33/hammer-719066__480.jpg'),
  ChatUser(
      uid: 'teacher',
      userName: '教師',
      metadata: {'description': '教育の専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1544717305-2782549b5136?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8dGVhY2hlcnxlbnwwfHx8fDE2NzkzMjMyNDY&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'economist',
      userName: '経済学者',
      metadata: {'description': '経済の専門家'},
      imageUrl:
          'https://media.istockphoto.com/id/1311598658/ja/%E3%82%B9%E3%83%88%E3%83%83%E3%82%AF%E3%83%95%E3%82%A9%E3%83%88/%E3%83%86%E3%83%96%E3%83%AC%E3%83%83%E3%83%88%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E4%B8%8A%E3%81%AE%E3%83%93%E3%82%B8%E3%83%8D%E3%82%B9%E3%83%9E%E3%83%B3%E5%8F%96%E5%BC%95%E3%82%AA%E3%83%B3%E3%83%A9%E3%82%A4%E3%83%B3%E6%A0%AA%E5%BC%8F%E5%B8%82%E5%A0%B4%E3%83%87%E3%82%B8%E3%82%BF%E3%83%AB%E6%8A%95%E8%B3%87%E3%82%B3%E3%83%B3%E3%82%BB%E3%83%97%E3%83%88.jpg?s=612x612&w=0&k=20&c=kqXUEqaFyjbF5CxeOe8vq7mzP_DoY3McexsjUq60VbA='),
  ChatUser(
      uid: 'engineer',
      userName: '工学者',
      metadata: {'description': '技術の専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1581092163144-b7ae3c00adbc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8NXx8ZW5naW5lZXJ8ZW58MHx8fHwxNjc5MzUyNzk4&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'gardener',
      userName: '園芸家',
      metadata: {'description': '植物の栽培や育成についての専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziARbQaUAARgsn?format=jpg&name=small'),
  ChatUser(
      uid: 'architect',
      userName: '建築家',
      metadata: {'description': '建築物の設計や監修をする専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziASQfaIAEIYkQ?format=jpg&name=small'),
  ChatUser(
      uid: 'furnitureDesigner',
      userName: '家具デザイナー',
      metadata: {'description': '家具のデザインに特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziATCzaMAEacn2?format=jpg&name=small'),
  ChatUser(
      uid: 'filmDirector',
      userName: '映画監督',
      metadata: {'description': '映画製作において指導・監督を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziAT-NaIAAARTe?format=jpg&name=small'),
  ChatUser(
      uid: 'painter',
      userName: '画家',
      metadata: {'description': '絵画を描く専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziBZLVaUAAwlMN?format=jpg&name=small'),
  ChatUser(
      uid: 'interiorDesigner',
      userName: 'インテリアデザイナー',
      metadata: {'description': '家具、カーテン、照明などのインテリアデザインに特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziBaJeaAAAketb?format=jpg&name=small'),
  ChatUser(
      uid: 'fashionDesigner',
      userName: 'ファッションデザイナー',
      metadata: {'description': '衣服やアクセサリーのデザインに特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziBbgCakAAhPGT?format=jpg&name=small'),
  ChatUser(
      uid: 'photographer',
      userName: '写真家',
      metadata: {'description': '写真を撮影する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziBdzBaQAAQmNO?format=jpg&name=small'),
  ChatUser(
      uid: 'geologist',
      userName: '地質学者',
      metadata: {'description': '地球の地質や地形を研究する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziCGhCaQAMw1WL?format=jpg&name=small'),
  ChatUser(
      uid: 'linguist',
      userName: '言語学者',
      metadata: {'description': '言語や言語現象を研究する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziCIMqaEAE8zF3?format=jpg&name=small'),
  ChatUser(
      uid: 'statistician',
      userName: '統計学者',
      metadata: {'description': 'データを分析して情報を得る専門家'},
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/08/18/13/26/interface-3614766__480.png'),
  ChatUser(
      uid: 'game-designer',
      userName: 'ゲームデザイナー',
      metadata: {'description': 'ビデオゲームの開発に特化した専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1542751371-adc38448a05e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8dmlkZW8lMjBnYW1lfGVufDB8fHx8MTY3OTQwMzQ0NQ&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'data-scientist',
      userName: 'データサイエンティスト',
      metadata: {'description': '大量のデータを収集・分析して、ビジネスの意思決定をサポートする専門家'},
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/12/03/22/15/tablet-1075790_1280.jpg'),
  ChatUser(
      uid: 'cartographer',
      userName: '地図学者',
      metadata: {'description': '地図を作成し、地理情報の収集・管理に従事する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziCJqxaEAAfalH?format=jpg&name=small'),
  ChatUser(
      uid: 'biologist',
      userName: '生物学者',
      metadata: {'description': '生物についての研究を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziCLN0agAArXn7?format=jpg&name=small'),
  ChatUser(
      uid: 'marketer',
      userName: 'マーケター',
      metadata: {'description': '商品やサービスの販売促進に特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziC593agAEbVER?format=jpg&name=small'),
  ChatUser(
      uid: 'entertainment-producer',
      userName: '芸能プロデューサー',
      metadata: {'description': '芸能活動においてタレントのマネジメントやイベントの企画・運営に従事する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziC75magAE9lYC?format=jpg&name=small'),
  ChatUser(
      uid: 'tv-director',
      userName: 'テレビディレクター',
      metadata: {'description': 'テレビ番組の制作において指揮をとる専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziC_H9aAAAn6fK?format=jpg&name=small'),
  ChatUser(
      uid: 'veterinarian',
      userName: '獣医師',
      metadata: {'description': '動物の疾患の診断・治療を行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1628009368231-7bb7cfcb0def?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8Mnx8dmV0ZXJpbmFyaWFufGVufDB8fHx8MTY3OTM2ODcyOA&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'massage-therapist',
      userName: 'マッサージ師',
      metadata: {'description': '身体のストレスや痛みの緩和を目的とした施術を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziDBfVaUAAW0bP?format=jpg&name=small'),
  ChatUser(
      uid: 'researcher',
      userName: '研究者',
      metadata: {'description': 'あるテーマについて研究を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziDeYaaQAMamTq?format=jpg&name=small'),
  ChatUser(
      uid: 'sportsTrainer',
      userName: 'スポーツトレーナー',
      metadata: {'description': 'スポーツ選手のコンディショニングやケガの予防・治療に従事する専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1604480133435-25b86862d276?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MjF8fHRyYWluZXJ8ZW58MHx8fHwxNjc5Mzk3MDE5&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'newsCaster',
      userName: 'ニュースキャスター',
      metadata: {'description': 'ニュース番組の司会や報道に従事する専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1619743088831-4d2c38b40cce?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8bWlrZSUyMHBlcnNvbnxlbnwwfHx8fDE2Nzk0MDM4NTI&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'socialWorker',
      userName: 'ソーシャルワーカー',
      metadata: {'description': '社会福祉や保健の問題に対して支援を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziDfkfaIAATDZE?format=jpg&name=small'),
  ChatUser(
      uid: 'consultant',
      userName: 'コンサルタント',
      metadata: {'description': '企業や組織の業務改善や問題解決のためのアドバイスを行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziDgdyaYAAlnac?format=jpg&name=small'),
  ChatUser(
      uid: 'nurse',
      userName: '看護師',
      metadata: {'description': '病院やクリニックで患者さんの健康管理や医療に関わる専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1584432810601-6c7f27d2362b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8bnVyc2V8ZW58MHx8fHwxNjc5Mzk5MDI0&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'sociologist',
      userName: '社会学者',
      metadata: {'description': '社会の構造や社会問題を研究する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziDiMfaMAIFMpK?format=jpg&name=small'),
  ChatUser(
      uid: 'illustrator',
      userName: 'イラストレーター',
      metadata: {'description': '絵を描くことに特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziEILGaAAUCtws?format=jpg&name=small'),
  ChatUser(
      uid: 'soundEngineer',
      userName: 'サウンドエンジニア',
      metadata: {'description': '音響の専門家で、音楽や映画、テレビなどの音響を制作する専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1520872024865-3ff2805d8bb3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTh8fHNpbmd8ZW58MHx8fHwxNjc5MzgyOTc5&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'seismologist',
      userName: '地震学者',
      metadata: {'description': '地震や地殻変動を研究する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziEJWUaIAE1ypl?format=jpg&name=small'),
  ChatUser(
      uid: 'foodsanitation',
      userName: '食品衛生士',
      metadata: {'description': '食品の衛生管理に特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziEKTZakAEOvOz?format=jpg&name=small'),
  ChatUser(
      uid: 'webdesigner',
      userName: 'ウェブデザイナー',
      metadata: {'description': 'ウェブサイトのデザインに特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziEL96aMAESS47?format=jpg&name=small'),
  ChatUser(
      uid: 'environmentalist',
      userName: '環境保護活動家',
      metadata: {'description': '環境問題に関する啓発活動や対策の提言を行う専門家'},
      imageUrl:
          'https://cdn.pixabay.com/photo/2023/02/14/04/39/volunteer-7788809_1280.jpg'),
  ChatUser(
      uid: 'copywriter',
      userName: 'コピーライター',
      metadata: {'description': '広告や宣伝のためのキャッチコピーを考える専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziE1QcaUAAKMsQ?format=jpg&name=small'),
  ChatUser(
      uid: 'manager',
      userName: 'マネージャー',
      metadata: {'description': 'アーティストやスポーツ選手、企業などのマネジメントを行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziE23XaUAIwcjP?format=jpg&name=360x360'),
  ChatUser(
      uid: 'educationalist',
      userName: '教育学者',
      metadata: {'description': '教育に関する研究や分析を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziE4BZakAEek-e?format=jpg&name=small'),
  ChatUser(
      uid: 'foodStylist',
      userName: 'フードスタイリスト',
      metadata: {'description': '料理や食材のスタイリングに特化した専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1526683224143-73288bb6996e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTd8fGVhdHxlbnwwfHx8fDE2Nzk0MDQ1MzE&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'fitnessInstructor',
      userName: 'フィットネスインストラクター',
      metadata: {'description': '健康やフィットネスに関する指導を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziE5FxaMAAcHHv?format=jpg&name=small'),
  ChatUser(
      uid: 'civilEngineer',
      userName: '土木技術者',
      metadata: {'description': '道路や橋などの土木工事に関する技術的なアドバイスを行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziF7B8aUAAh4KK?format=jpg&name=small'),
  ChatUser(
      uid: 'technicalWriter',
      userName: 'テクニカルライター',
      metadata: {'description': '科学技術や医学などの専門的な知識を持ったライター'},
      imageUrl:
          'https://pbs.twimg.com/media/FziF8d_agAAiQGv?format=jpg&name=small'),
  ChatUser(
      uid: 'freelanceWriter',
      userName: 'ジャーナリスト',
      metadata: {'description': '作家やジャーナリストなど、フリーランスで執筆活動を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziF-UIaYAIhzfC?format=jpg&name=small'),
  ChatUser(
      uid: 'itConsultant',
      userName: 'ITコンサルタント',
      metadata: {'description': 'コンピューターシステムやソフトウェアのアドバイスを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1583508915901-b5f84c1dcde1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTh8fGZyZWVsYW5jZXxlbnwwfHx8fDE2NzkzMjI1ODU&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'gemologist',
      userName: '宝石鑑定士',
      metadata: {'description': '宝石の鑑定に特化した専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1610575528294-97e56df074f9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8Z2VtJTIwcGVyc29ufGVufDB8fHx8MTY3OTQwNDcwMA&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'financialPlanner',
      userName: 'ファイナンシャルプランナー',
      metadata: {'description': '資産運用やライフプランに関するアドバイスを行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziF_kcakAEmvuZ?format=jpg&name=small'),
  ChatUser(
      uid: 'aromatherapist',
      userName: 'アロマセラピスト',
      metadata: {'description': 'アロマオイルを使用したセラピーを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1515377905703-c4788e51af15?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8YXJvbWF8ZW58MHx8fHwxNjc5MzU3MjQ1&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'stylist',
      userName: 'スタイリスト',
      metadata: {'description': '衣服やメイクアップのスタイリングに特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziGejJaQAAPKip?format=jpg&name=small'),
  ChatUser(
      uid: 'homeStager',
      userName: 'ホームステージャー',
      metadata: {'description': '不動産物件の内装装飾やレイアウトのアドバイスを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1523217582562-09d0def993a6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTZ8fGhvbWV8ZW58MHx8fHwxNjc5NDA0ODE2&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'graphicDesigner',
      userName: 'グラフィックデザイナー',
      metadata: {'description': '広告やポスター、パンフレットなどのデザインに特化した専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1622119029245-5bf43951115a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8N3x8dWl8ZW58MHx8fHwxNjc5NDA0ODU5&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'pharmacist',
      userName: '薬剤師',
      metadata: {'description': '薬剤や薬の効果・副作用に関する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziGgGWagAEygJm?format=jpg&name=small'),
  ChatUser(
      uid: 'sportsTrainer',
      userName: 'スポーツトレーナー',
      metadata: {'description': 'スポーツ選手やアスリートの身体管理やトレーニング指導を行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1517438984742-1262db08379e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTd8fHRyYWluZXJ8ZW58MHx8fHwxNjc5Mzk3MDE5&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'housekeeper',
      userName: 'ハウスキーパー',
      metadata: {'description': '家事代行や掃除、洗濯、料理などの家庭サービスを提供する専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1578593195423-df7df9563457?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8aG91c2VrZWVwZXJ8ZW58MHx8fHwxNjc5NDA0OTQ0&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'prosecutor',
      userName: '検察官',
      metadata: {'description': '刑事司法の専門家で、犯罪の捜査や訴追を行う'},
      imageUrl:
          'https://images.unsplash.com/photo-1649653084130-06638e40ca25?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8NHx8cHJvc2VjdXRvcnxlbnwwfHx8fDE2Nzk0MDQ5Nzc&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'radioDJ',
      userName: 'ラジオDJ',
      metadata: {'description': 'ラジオ番組のパーソナリティとして、音楽やトークを担当する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziGhc-aMAISHzt?format=jpg&name=small'),
  ChatUser(
      uid: 'projectManager',
      userName: 'プロジェクトマネージャー',
      metadata: {'description': 'プロジェクトの計画や進行管理、チームのコーディネートを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1531403009284-440f080d1e12?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8cHJvamVjdCUyMG1hbmFnZXJ8ZW58MHx8fHwxNjc5NDA1MDYw&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'speechTherapist',
      userName: 'スピーチセラピスト',
      metadata: {'description': '言語障害のある人のために、コミュニケーションスキルを向上させるセラピーを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1576778453123-ab240b89dd52?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MjJ8fHNwZWVjaHxlbnwwfHx8fDE2NzkzNDk1MTE&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'managementConsultant',
      userName: '経営コンサルタント',
      metadata: {'description': '経営戦略やマーケティング戦略に関するアドバイスを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1600880292203-757bb62b4baf?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8OHx8Y29uc3VsdGFudHxlbnwwfHx8fDE2NzkzNzc1ODY&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'artDirector',
      userName: 'アートディレクター',
      metadata: {'description': '広告や映像作品、出版物などのアートディレクションを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1598387746216-506f6bd47aad?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8YXJ0JTIwZGlyZWN0b3J8ZW58MHx8fHwxNjc5NDA1MjY5&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'hotelManager',
      userName: 'ホテルマネージャー',
      metadata: {'description': 'ホテル運営に関する全般的なマネジメントを行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziGkveaEAAGHIy?format=jpg&name=small'),
  ChatUser(
      uid: 'personalTrainer',
      userName: 'パーソナルトレーナー',
      metadata: {'description': '個人的なフィットネスプランの作成やトレーニング指導を行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1519311965067-36d3e5f33d39?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8cGVyc29uYWwlMjB0cmFpbmVyfGVufDB8fHx8MTY3OTQwNTM0MQ&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'translator',
      userName: '翻訳家',
      metadata: {'description': '外国語の翻訳に特化した専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1575707751065-42256084fbb7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8OXx8c3BlZWNofGVufDB8fHx8MTY3OTM0OTUxMQ&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'audioEngineer',
      userName: '音響エンジニア',
      metadata: {'description': '音楽や映画、テレビ番組などの音響に特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziHTC8aEAA5y1t?format=jpg&name=small'),
  ChatUser(
      uid: 'producer',
      userName: 'プロデューサー',
      metadata: {'description': 'テレビ番組、映画、音楽などの制作に関わる専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1516223725307-6f76b9ec8742?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8Nnx8cHJvZHVjZXJ8ZW58MHx8fHwxNjc5NDAzNTQ5&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'marketingSpecialist',
      userName: 'マーケティング担当者',
      metadata: {'description': '製品やサービスの販売戦略を立案し、マーケティング活動を行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1670272505497-d532f0b50702?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDF8MXxzZWFyY2h8MXx8b2ZmaWNlfGVufDB8fHx8MTY3OTM1ODI2OQ&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'mentalHealthCounselor',
      userName: 'メンタルヘルスカウンセラー',
      metadata: {'description': '心理学やカウンセリングの知識を持ち、メンタルヘルスに関する相談やアドバイスを行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziHUbzaMAEJocZ?format=jpg&name=small'),
  ChatUser(
      uid: 'animator',
      userName: 'アニメーター',
      metadata: {'description': 'アニメーション映画やテレビ番組の制作に携わる専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziHWC8aQAAcpuO?format=jpg&name=small'),
  ChatUser(
      uid: 'businessConsultant',
      userName: 'ビジネスコンサルタント',
      metadata: {'description': '企業や組織の経営や業務改善に関するアドバイスを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1664575599730-0814817939de?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8N3x8YnVzaW5lc3N8ZW58MHx8fHwxNjc5MzYyNTEx&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'policeOfficer',
      userName: '警察官',
      metadata: {'description': '治安維持や交通規制、犯罪の捜査や防止などを行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziHW6DacAIh63y?format=jpg&name=small'),
  ChatUser(
      uid: 'photographer',
      userName: 'フォトグラファー',
      metadata: {'description': '写真撮影に特化した専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1625492922105-5914617fd869?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTh8fHBob3RvZ3JhcGhlcnxlbnwwfHx8fDE2Nzk0MDU4OTk&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'organizer',
      userName: 'オーガナイザー',
      metadata: {'description': '収納や片付けのアドバイスを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1577415124269-fc1140a69e91?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8NTJ8fGJ1c2luZXNzfGVufDB8fHx8MTY3OTM2MjUxMg&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'restaurantOwner',
      userName: 'レストランオーナー',
      metadata: {'description': '飲食店の経営を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziH0lJaUAANQ9S?format=jpg&name=small'),
  ChatUser(
      uid: 'securityConsultant',
      userName: 'セキュリティコンサルタント',
      metadata: {'description': '防犯対策や情報セキュリティに関するアドバイスを行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziH1l2aIAUYUrK?format=jpg&name=small'),
  ChatUser(
      uid: 'programmer',
      userName: 'プログラマー',
      metadata: {'description': 'コンピュータプログラムの開発や保守に関する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziH3ktagAIaL9f?format=jpg&name=small'),
  ChatUser(
      uid: 'aircraftPilot',
      userName: '航空機パイロット',
      metadata: {
        'description': '航空機の操縦や運航に関する専門家',
      },
      imageUrl:
          'https://pbs.twimg.com/media/FziH5NDaYAQFy97?format=jpg&name=small'),
  ChatUser(
      uid: 'logoDesigner',
      userName: 'ロゴデザイナー',
      metadata: {
        'description': 'ロゴやブランディングに関するデザインに特化した専門家',
      },
      imageUrl:
          'https://images.unsplash.com/photo-1612831660846-778e3a5548bd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTZ8fGRlc2lnbmVyfGVufDB8fHx8MTY3OTQwNjIyMQ&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'speechTrainer',
      userName: 'スピーチトレーナー',
      metadata: {
        'description': 'スピーチやプレゼンテーションの指導に特化した専門家',
      },
      imageUrl:
          'https://images.unsplash.com/photo-1564522365984-c08ed1f78893?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8c3BlZWNofGVufDB8fHx8MTY3OTM0OTUxMQ&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'writer',
      userName: 'ライター',
      metadata: {
        'description': '文章の執筆や編集に特化した専門家',
      },
      imageUrl:
          'https://pbs.twimg.com/media/FziIQbvakAYjf_-?format=jpg&name=small'),
  ChatUser(
      uid: 'securitiesAnalyst',
      userName: '証券アナリスト',
      metadata: {
        'description': '株式や債券などの投資商品の分析や予測に関する専門家',
      },
      imageUrl:
          'https://pbs.twimg.com/media/FziIScWaAAAngrt?format=jpg&name=small'),
  ChatUser(
      uid: 'webMarketer',
      userName: 'ウェブマーケター',
      metadata: {
        'description': 'ウェブサイトやソーシャルメディアを活用したマーケティングに関する専門家',
      },
      imageUrl:
          'https://images.unsplash.com/photo-1557804506-669a67965ba0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8d2ViJTIwbWFya2V0ZXJ8ZW58MHx8fHwxNjc5NDA2NDU1&ixlib=rb-4.0.3&q=80&w=400'),
  ChatUser(
      uid: 'beautician',
      userName: '美容師',
      metadata: {
        'description': '髪型やメイクなどの美容に特化した専門家',
      },
      imageUrl:
          'https://pbs.twimg.com/media/FziITdwaEDML9jT?format=jpg&name=small'),
  ChatUser(
      uid: 'robot-designer',
      userName: 'ロボットデザイナー',
      metadata: {
        'description': '色彩を利用して心理的な問題を解決する専門職',
      },
      imageUrl:
          'https://pbs.twimg.com/media/FziIU20aQAEziVA?format=jpg&name=small'),
];
const greatPeople = [
  ChatUser(
      uid: 'Albert-Einstein.',
      userName: 'アルベルト・アインシュタイン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Einstein1921_by_F_Schmutzer_2.jpg/225px-Einstein1921_by_F_Schmutzer_2.jpg'),
  ChatUser(
      uid: 'Isaac-Newton',
      userName: 'アイザック・ニュートン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/GodfreyKneller-IsaacNewton-1689.jpg/225px-GodfreyKneller-IsaacNewton-1689.jpg'),
  ChatUser(
      uid: 'Charles-Darwin',
      userName: 'チャールズ・ダーウィン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Hw-darwin.jpg/225px-Hw-darwin.jpg'),
  ChatUser(
      uid: 'Galileo-Galilei',
      userName: 'ガリレオ・ガリレイ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Galileo-sustermans2.jpg/225px-Galileo-sustermans2.jpg'),
  ChatUser(
      uid: 'Leonardo-da-Vinci',
      userName: 'レオナルド・ダ・ヴィンチ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Leonardo_da_Vinci_-_presumed_self-portrait_-_WGA12798.jpg/220px-Leonardo_da_Vinci_-_presumed_self-portrait_-_WGA12798.jpg'),
  ChatUser(
      uid: 'Pythagoras',
      userName: 'ピタゴラス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Kapitolinischer_Pythagoras_adjusted.jpg/200px-Kapitolinischer_Pythagoras_adjusted.jpg'),
  ChatUser(
      uid: 'Carl-Friedrich-Gauss',
      userName: 'カール・フリードリヒ・ガウス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Carl_Friedrich_Gauss.jpg/225px-Carl_Friedrich_Gauss.jpg'),
  ChatUser(
      uid: 'Nikola-Tesla',
      userName: 'ニコラ・テスラ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Tesla_Sarony.jpg/225px-Tesla_Sarony.jpg'),
  ChatUser(
      uid: 'Michael-Faraday',
      userName: 'マイケル・ファラデー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Michael_Faraday_001.jpg/200px-Michael_Faraday_001.jpg'),
  ChatUser(
      uid: 'Srinivasa-Ramanujan',
      userName: 'シュリニヴァーサ・ラマヌジャン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Srinivasa_Ramanujan_-_OPC_-_1.jpg/450px-Srinivasa_Ramanujan_-_OPC_-_1.jpg'),
  ChatUser(
      uid: "Yosa-no-Akiko",
      userName: "与謝野晶子",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/7/72/Akiko_Yosano_younger.jpg"),
  ChatUser(
      uid: 'Jean-Henri-Fabre.',
      userName: 'ジャン・アンリ・ファーブル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Jean-henri_fabre.jpg/225px-Jean-henri_fabre.jpg'),
  ChatUser(
      uid: 'Louis-Pasteur',
      userName: 'ルイ・パスツール',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Louis_Pasteur.jpg/225px-Louis_Pasteur.jpg'),
  ChatUser(
      uid: 'Ukichiro-Nakatani',
      userName: '中谷宇吉郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Nakaya_Ukichiro_in_1946.jpg/250px-Nakaya_Ukichiro_in_1946.jpg'),
  ChatUser(
      uid: 'Shibasaburo-Kitasato',
      userName: '北里柴三郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Kitasato_Shibasaburo.jpg/250px-Kitasato_Shibasaburo.jpg'),
  ChatUser(
      uid: 'Antoine-Lavoisier',
      userName: 'アントワーヌ・ラヴォアジエ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/David_-_Portrait_of_Monsieur_Lavoisier_%28cropped%29.jpg/225px-David_-_Portrait_of_Monsieur_Lavoisier_%28cropped%29.jpg'),
  ChatUser(
      uid: 'the-Wright-brothers',
      userName: 'ライト兄弟',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Wilbur_Wright.jpg/150px-Wilbur_Wright.jpg'),
  ChatUser(
      uid: 'Marie-Curie.',
      userName: 'マリ・キュリー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Marie_Curie_1903.jpg/225px-Marie_Curie_1903.jpg'),
  ChatUser(
      uid: 'Alfred-Wegener',
      userName: 'アルフレート・ヴェーゲナー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Alfred_Wegener_ca.1924-30.jpg/250px-Alfred_Wegener_ca.1924-30.jpg'),
  ChatUser(
      uid: 'I-no-Tadataka',
      userName: '伊能忠敬',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/I-no-tadataka%2Csawara%2Ckatori-city%2Cjapan.JPG/200px-I-no-tadataka%2Csawara%2Ckatori-city%2Cjapan.JPG'),
  ChatUser(
      uid: 'James-Watt',
      userName: 'ジェームズ・ワット',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Watt_James_von_Breda.jpg/250px-Watt_James_von_Breda.jpg'),
  ChatUser(
      uid: 'Dmitri-Mendeleyev',
      userName: 'ドミトリ・メンデレーエフ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/DIMendeleevCab.jpg/225px-DIMendeleevCab.jpg'),
  ChatUser(
      uid: 'Tomitaro-Makino',
      userName: '牧野富太郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Makino_Tomitaro.jpg/200px-Makino_Tomitaro.jpg'),
  ChatUser(
      uid: 'Gregor-Johan-Mendel.',
      userName: 'グレゴール・ヨハン・メンデル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Gregor_Mendel.png/225px-Gregor_Mendel.png'),
  ChatUser(
      uid: 'Fritjof-Nansen.',
      userName: 'フリチョフ・ナンセン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Bundesarchiv_Bild_102-09772%2C_Fridjof_Nansen.jpg/200px-Bundesarchiv_Bild_102-09772%2C_Fridjof_Nansen.jpg'),
  ChatUser(
      uid: 'Sugita-Genpaku',
      userName: '杉田玄白',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Sugita_Genpaku.jpg/220px-Sugita_Genpaku.jpg'),
  ChatUser(
      uid: 'Jean-François-Champollion',
      userName: 'ジャン＝フランソワ・シャンポリオン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Jean-Francois_Champollion_2.jpg/250px-Jean-Francois_Champollion_2.jpg'),
  ChatUser(
      uid: 'Nagaoka-Hantaro',
      userName: '長岡半太郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Hantaro_Nagaoka.jpg/225px-Hantaro_Nagaoka.jpg'),
  ChatUser(
      uid: 'James-Clark-Maxwell.',
      userName: 'ジェームズ・クラーク・マクスウェル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/James_Clerk_Maxwell.png/225px-James_Clerk_Maxwell.png'),
  ChatUser(
      uid: 'Kotaro-Honda',
      userName: '本多光太郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Kotaro_Honda.jpg/200px-Kotaro_Honda.jpg'),
  ChatUser(
      uid: 'Paul-Ehrlich',
      userName: 'パウル・エールリヒ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Paul_Ehrlich_1915.jpg/200px-Paul_Ehrlich_1915.jpg'),
  ChatUser(
      uid: 'Niels-Bohr.',
      userName: 'ニールス・ボーア',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Niels_Bohr.jpg/225px-Niels_Bohr.jpg'),
  ChatUser(
      uid: 'Archimedes',
      userName: 'アルキメデス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Retrato_de_un_erudito_%28%C2%BFArqu%C3%ADmedes%3F%29%2C_por_Domenico_Fetti.jpg/225px-Retrato_de_un_erudito_%28%C2%BFArqu%C3%ADmedes%3F%29%2C_por_Domenico_Fetti.jpg'),
  ChatUser(
      uid: 'John-Dalton',
      userName: 'ジョン・ドルトン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Dalton_John_desk.jpg/240px-Dalton_John_desk.jpg'),
  ChatUser(
      uid: 'William-Ramsey',
      userName: 'ウィリアム・ラムゼー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/William_Ramsay.jpg/180px-William_Ramsay.jpg'),
  ChatUser(
      uid: 'Hideki-Yukawa',
      userName: '湯川秀樹',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Yukawa.jpg/225px-Yukawa.jpg'),
  ChatUser(
      uid: 'Konstantin-Tsiolkovsky.',
      userName: 'コンスタンチン・ツィオルコフスキー',
      imageUrl: 'https://weblio.hs.llnwd.net/e7/img/dict/spchk/207.jpg'),
  ChatUser(
      uid: 'Justus-von-Liebig',
      userName: 'ユストゥス・フォン・リービッヒ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/b/b2/Justus_von_Liebig.jpg'),
  ChatUser(
      uid: 'Antoni-van-Leeuwenhoek.',
      userName: 'アントニ・ファン・レーウェンフック',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Jan_Verkolje_-_Antonie_van_Leeuwenhoek.jpg/225px-Jan_Verkolje_-_Antonie_van_Leeuwenhoek.jpg'),
  ChatUser(
      uid: 'Hiraga-Gennai',
      userName: '平賀源内',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/A_Portrait_of_Ky%C5%ABkei_Hiraga_cropped.jpg/250px-A_Portrait_of_Ky%C5%ABkei_Hiraga_cropped.jpg'),
  ChatUser(
      uid: 'Alexander-Graham-Bell.',
      userName: 'アレクサンダー・グラハム・ベル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Alexander_Graham_Bell.jpg/225px-Alexander_Graham_Bell.jpg'),
  ChatUser(
      uid: 'Ernest-Rutherford.',
      userName: 'アーネスト・ラザフォード',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Ernest_Rutherford_LOC.jpg/250px-Ernest_Rutherford_LOC.jpg'),
  ChatUser(
      uid: 'Alexander-Fleming.',
      userName: 'アレクサンダー・フレミング',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Synthetic_Production_of_Penicillin_TR1468.jpg/200px-Synthetic_Production_of_Penicillin_TR1468.jpg'),
  ChatUser(
      uid: 'Guglielmo-Marconi',
      userName: 'グリエルモ・マルコーニ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Guglielmo_Marconi.jpg/225px-Guglielmo_Marconi.jpg'),
  ChatUser(
      uid: 'James-Hutton',
      userName: 'ジェームズ・ハットン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Hutton_James_portrait_Raeburn.jpg/225px-Hutton_James_portrait_Raeburn.jpg'),
  ChatUser(
      uid: 'Max-Delbrück.',
      userName: 'マックス・デルブリュック',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Maxdelbr%C3%BCck.jpg/225px-Maxdelbr%C3%BCck.jpg'),
  ChatUser(
      uid: 'Walt-Disney',
      userName: 'ウォルト・ディズニー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Walt_disney_portrait.jpg/250px-Walt_disney_portrait.jpg'),
  ChatUser(
      uid: 'Edmund-Halley',
      userName: 'エドモンド・ハレー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Edmund_Halley.gif/225px-Edmund_Halley.gif'),
  ChatUser(
      uid: 'Georges-Cuvier',
      userName: 'ジョルジュ・キュヴィエ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Bolton-cuvier.jpg/225px-Bolton-cuvier.jpg'),
  ChatUser(
      uid: 'Aristotle',
      userName: 'アリストテレス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Aristotle_Altemps_Inv8575.jpg/200px-Aristotle_Altemps_Inv8575.jpg'),
  ChatUser(
      uid: 'Roar-Amundsen.',
      userName: 'ロアール・アムンセン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Nlc_amundsen.jpg/200px-Nlc_amundsen.jpg'),
  ChatUser(
      uid: 'Heinrich-Schliemann.',
      userName: 'ハインリヒ・シュリーマン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Heinrich_Schliemann.jpg/220px-Heinrich_Schliemann.jpg'),
  ChatUser(
      uid: 'Takakazu-Seki',
      userName: '関孝和',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Seki.jpeg/220px-Seki.jpeg'),
  ChatUser(
      uid: 'Max-Planck.',
      userName: 'マックス・プランク',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Max_Planck_1933.jpg/225px-Max_Planck_1933.jpg'),
  ChatUser(
      uid: 'Howard-Carter',
      userName: 'ハワード・カーター',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Howard_carter.jpg/173px-Howard_carter.jpg'),
  ChatUser(
      uid: 'Roberto-Bunsen',
      userName: 'ロベルト・ブンゼン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Robert_Bunsen_02.jpg/200px-Robert_Bunsen_02.jpg'),
  ChatUser(
      uid: 'Niels-Abel',
      userName: 'ニールス・アーベル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Niels_Henrik_Abel.jpg/180px-Niels_Henrik_Abel.jpg'),
  ChatUser(
      uid: 'Auguste-Picard',
      userName: 'オーギュスト・ピカール',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Bundesarchiv_Bild_102-13738%2C_Auguste_Piccard.jpg/220px-Bundesarchiv_Bild_102-13738%2C_Auguste_Piccard.jpg'),
  ChatUser(
      uid: 'Christopher-Columbus',
      userName: 'クリストファー・コロンブス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Ridolfo_Ghirlandaio_Columbus.jpg/200px-Ridolfo_Ghirlandaio_Columbus.jpg'),
  ChatUser(
      uid: 'George-Stevenson.',
      userName: 'ジョージ・スチーブンソン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/GeorgeStephenson.PNG/220px-GeorgeStephenson.PNG'),
  ChatUser(
      uid: 'Charles-Lindbergh',
      userName: 'チャールズ・リンドバーグ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Col_Charles_Lindbergh.jpg/200px-Col_Charles_Lindbergh.jpg'),
  ChatUser(
      uid: 'Johannes-Kepler',
      userName: 'ヨハネス・ケプラー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Kepler.png/225px-Kepler.png'),
  ChatUser(
      uid: 'Ferdinand-Magellan',
      userName: 'フェルディナンド・マゼラン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Ferdinand_Magellan.jpg/180px-Ferdinand_Magellan.jpg'),
  ChatUser(
      uid: 'Robert-Boyle',
      userName: 'ロバート・ボイル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Robert_Boyle_0001.jpg/250px-Robert_Boyle_0001.jpg'),
  ChatUser(
      uid: 'Sven-Hedin.',
      userName: 'スヴェン・ヘディン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Sven_Hedin_01.jpg/250px-Sven_Hedin_01.jpg'),
  ChatUser(
      uid: 'Heike-Kammerling-Onnes.',
      userName: 'ヘイケ・カメルリング・オネス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Kamerlingh_portret.jpg/200px-Kamerlingh_portret.jpg'),
  ChatUser(
      uid: 'Johannes-Gutenberg.',
      userName: 'ヨハネス・グーテンベルク',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Gutenberg.jpg/220px-Gutenberg.jpg'),
  ChatUser(
      uid: 'Masatoshi-Okochi',
      userName: '大河内正敏',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Masatoshi_Okochi.JPG/200px-Masatoshi_Okochi.JPG'),
  ChatUser(
      uid: 'Erwin-Schrodinger.',
      userName: 'エルヴィン・シュレーディンガー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Erwin_Schr%C3%B6dinger_%281933%29.jpg/225px-Erwin_Schr%C3%B6dinger_%281933%29.jpg'),
  ChatUser(
      uid: 'Blaise-Pascal',
      userName: 'ブレーズ・パスカル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Blaise_pascal.jpg/200px-Blaise_pascal.jpg'),
  ChatUser(
      uid: 'Wendell-Stanley.',
      userName: 'ウェンデル・スタンリー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Wendell_Meredith_Stanley.jpg/200px-Wendell_Meredith_Stanley.jpg'),
  ChatUser(
      uid: 'Robert-Peary.',
      userName: 'ロバート・ピアリー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/RobertPeary.jpg/200px-RobertPeary.jpg'),
  ChatUser(
      uid: 'Werner-Heisenberg',
      userName: 'ヴェルナー・ハイゼンベルク',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Bundesarchiv_Bild183-R57262%2C_Werner_Heisenberg.jpg/225px-Bundesarchiv_Bild183-R57262%2C_Werner_Heisenberg.jpg'),
  ChatUser(
      uid: 'Amedeo-Avogadro.',
      userName: 'アメデオ・アヴォガドロ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Amadeo_Avogadro.png/225px-Amadeo_Avogadro.png'),
  ChatUser(
      uid: 'Karl-Benz',
      userName: 'カール・ベンツ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Karl_Benz.jpg/220px-Karl_Benz.jpg'),
  ChatUser(
      uid: 'Edward-Jenner.',
      userName: 'エドワード・ジェンナー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Edward_Jenner.jpg/225px-Edward_Jenner.jpg'),
  ChatUser(
      uid: 'Alessandro-Volta',
      userName: 'アレッサンドロ・ボルタ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Alessandro_Volta.jpeg/225px-Alessandro_Volta.jpeg'),
  ChatUser(
      uid: 'Hata-Sahachiro',
      userName: '秦佐八郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Sahachiro_Hata.jpg/180px-Sahachiro_Hata.jpg'),
  ChatUser(
      uid: 'Philipp-Franz-von-Siebold',
      userName: 'フィリップ・フランツ・フォン・シーボルト',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/%E3%82%B7%E3%83%BC%E3%83%9C%E3%83%AB%E3%83%88_%E5%B7%9D%E5%8E%9F%E6%85%B6%E8%B3%80%E7%AD%86.jpg/250px-%E3%82%B7%E3%83%BC%E3%83%9C%E3%83%AB%E3%83%88_%E5%B7%9D%E5%8E%9F%E6%85%B6%E8%B3%80%E7%AD%86.jpg'),
  ChatUser(
      uid: 'John-von-Neumann',
      userName: 'ジョン・フォン・ノイマン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/JohnvonNeumann-LosAlamos.gif/225px-JohnvonNeumann-LosAlamos.gif'),
  ChatUser(
      uid: 'Robert-Fulton',
      userName: 'ロバート・フルトン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Fulton.jpg/200px-Fulton.jpg'),
  ChatUser(
      uid: 'Edmund-Hillary',
      userName: 'エドモンド・ヒラリー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Edmundhillarycropped.jpg/200px-Edmundhillarycropped.jpg'),
  ChatUser(
      uid: 'Hugo-de-Vries',
      userName: 'ユーゴー・ド・フリース',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Hugo_de_Vries_2.jpg/200px-Hugo_de_Vries_2.jpg'),
  ChatUser(
      uid: 'Wallace-Carothers.',
      userName: 'ウォーレス・カロザース',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Wallace_Carothers%2C_in_the_lab.jpg/225px-Wallace_Carothers%2C_in_the_lab.jpg'),
  ChatUser(
      uid: 'Thomas-Edison.',
      userName: 'トーマス・エジソン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Thomas_Edison2.jpg/250px-Thomas_Edison2.jpg'),
  ChatUser(
      uid: 'Carl-von-Rinne',
      userName: 'カール・フォン・リンネ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Carl_von_Linn%C3%A9.jpg/180px-Carl_von_Linn%C3%A9.jpg'),
  ChatUser(
      uid: 'Henry-Cavendish',
      userName: 'ヘンリー・キャヴェンディッシュ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Cavendish_Henry_signature.jpg/225px-Cavendish_Henry_signature.jpg'),
  ChatUser(
      uid: 'Louis-Jacques-Mande-Daguerre',
      userName: 'ルイ・ジャック・マンデ・ダゲール',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Louis_Daguerre.jpg/220px-Louis_Daguerre.jpg'),
  ChatUser(
      uid: 'Robert-Koch',
      userName: 'ローベルト・コッホ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Robert_Koch.jpg/225px-Robert_Koch.jpg'),
  ChatUser(
      uid: 'Nicolaus-Copernicus',
      userName: 'ニコラウス・コペルニクス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Nikolaus_Kopernikus.jpg/225px-Nikolaus_Kopernikus.jpg'),
  ChatUser(
      uid: 'Alfred-Nobel',
      userName: 'アルフレッド・ノーベル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/AlfredNobel2.jpg/200px-AlfredNobel2.jpg'),
  ChatUser(
      uid: 'Albert-Michelson',
      userName: 'アルバート・マイケルソン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Albert_Abraham_Michelson2.jpg/225px-Albert_Abraham_Michelson2.jpg'),
  ChatUser(
      uid: 'George-Gamow',
      userName: 'ジョージ・ガモフ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/1/1d/Bragg_lab1_1930_%28cropped%29.jpg'),
  ChatUser(
      uid: 'Alexander-von-Humboldt',
      userName: 'アレクサンダー・フォン・フンボルト',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/AvHumboldt.jpg/225px-AvHumboldt.jpg'),
  ChatUser(
      uid: 'René-Descartes',
      userName: 'ルネ・デカルト',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Frans_Hals_-_Portret_van_Ren%C3%A9_Descartes.jpg/200px-Frans_Hals_-_Portret_van_Ren%C3%A9_Descartes.jpg'),
  ChatUser(
      uid: 'James-Prescott-Jules',
      userName: 'ジェームズ・プレスコット・ジュール',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Joule_James_sitting.jpg/250px-Joule_James_sitting.jpg'),
  ChatUser(
      uid: 'Himiko',
      userName: '卑弥呼',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Himiko_Queen_of_Yamataikoku.jpg/400px-Himiko_Queen_of_Yamataikoku.jpg'),
  ChatUser(
      uid: 'Yamato-Takel',
      userName: 'ヤマトタケル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Yamato_Takeru%28bronze_statue%2COsaka%2901.jpg/250px-Yamato_Takeru%28bronze_statue%2COsaka%2901.jpg'),
  ChatUser(
      uid: 'Jintoku-tenno',
      userName: '仁徳天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Nintoku-tenn%C5%8D_detail.jpg/190px-Nintoku-tenn%C5%8D_detail.jpg'),
  ChatUser(
      uid: 'soga-no-umako',
      userName: '蘇我馬子',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Soga_no_Umako.jpg/240px-Soga_no_Umako.jpg'),
  ChatUser(
      uid: 'Shotoku-Taishi',
      userName: '聖徳太子',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Umayado_Miko.jpg/220px-Umayado_Miko.jpg'),
  ChatUser(
      uid: 'Ono-no-Imoko',
      userName: '小野妹子',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Grave_of_Onono_Imoko1.jpg/220px-Grave_of_Onono_Imoko1.jpg'),
  ChatUser(
      uid: 'Suoga-Iruka',
      userName: '蘇我入鹿',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Kamatari_and_Prince_Oe_Killing_the_Usurper_Iruka_LACMA_M.84.31.251.jpg/200px-Kamatari_and_Prince_Oe_Killing_the_Usurper_Iruka_LACMA_M.84.31.251.jpg'),
  ChatUser(
      uid: 'Nakanoooe-no-oji',
      userName: '中大兄皇子',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Emperor_Tenji.jpg/250px-Emperor_Tenji.jpg'),
  ChatUser(
      uid: 'Leoš-Janacek',
      userName: 'レオシュ・ヤナーチェク',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Leos_Janacek_relief.jpg/135px-Leos_Janacek_relief.jpg'),
  ChatUser(
      uid: 'Emperor-Temmu',
      userName: '天武天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Emperor_Tenmu.jpg/300px-Emperor_Tenmu.jpg'),
  ChatUser(
      uid: 'Fujiwara-no-Fuhito',
      userName: '藤原不比等',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Fujiwara-Fuhito.jpg/230px-Fujiwara-Fuhito.jpg'),
  ChatUser(
      uid: 'Emperor-Shomu',
      userName: '聖武天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Emperor_Shomu.jpg/250px-Emperor_Shomu.jpg'),
  ChatUser(
      uid: 'gyo-ki',
      userName: '行基',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Gyouki_1.jpg/260px-Gyouki_1.jpg'),
  ChatUser(
      uid: 'ganjin',
      userName: '鑑真',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Ganjin_wajyo_portrait.JPG/220px-Ganjin_wajyo_portrait.JPG'),
  ChatUser(
      uid: 'dokyo',
      userName: '道鏡',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Signature_Manuscript_Dokyo_ACE763.JPG/120px-Signature_Manuscript_Dokyo_ACE763.JPG'),
  ChatUser(
      uid: 'Emperor-Kammu',
      userName: '桓武天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Emperor_Kammu_large.jpg/225px-Emperor_Kammu_large.jpg'),
  ChatUser(
      uid: 'Sakagami-Tamuramaro',
      userName: '坂上田村麻呂',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Sakanoue_Tamuramaro_sw.jpg/250px-Sakanoue_Tamuramaro_sw.jpg'),
  ChatUser(
      uid: 'saityo',
      userName: '最澄',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/%E6%9C%80%E6%BE%84%E5%83%8F_%E4%B8%80%E4%B9%97%E5%AF%BA%E8%94%B5_%E5%B9%B3%E5%AE%89%E6%99%82%E4%BB%A3.jpg/250px-%E6%9C%80%E6%BE%84%E5%83%8F_%E4%B8%80%E4%B9%97%E5%AF%BA%E8%94%B5_%E5%B9%B3%E5%AE%89%E6%99%82%E4%BB%A3.jpg'),
  ChatUser(
      uid: 'Kukai',
      userName: '空海',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/9/98/Kobo_Daishi_%28Taisanji_Matsuyama%29.jpg'),
  ChatUser(
      uid: 'Fujiwara-no-Yoshifusa',
      userName: '藤原良房',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Fujiwara_no_Yoshifusa.jpg/220px-Fujiwara_no_Yoshifusa.jpg'),
  ChatUser(
      uid: 'Sugawara-no-Michizane',
      userName: '菅原道真',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Sugawara_Michizane.jpg/200px-Sugawara_Michizane.jpg'),
  ChatUser(
      uid: 'Taira--no-Masakado',
      userName: '平将門',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Taira_no_Masakado_01.jpg/250px-Taira_no_Masakado_01.jpg'),
  ChatUser(
      uid: 'Fujiwara-Junyu',
      userName: '藤原純友',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Fujiwara_no_Sumitomo.jpg/200px-Fujiwara_no_Sumitomo.jpg'),
  ChatUser(
      uid: 'seisyo-nagon',
      userName: '清少納言',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/6/6f/Sei_Shonagon2.jpg'),
  ChatUser(
      uid: 'murasaki-shikibu',
      userName: '紫式部',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Murasaki-Shikibu-composing-Genji-Monogatari.png/200px-Murasaki-Shikibu-composing-Genji-Monogatari.png'),
  ChatUser(
      uid: 'Fujiwara-no-Michinaga',
      userName: '藤原道長',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/f/f3/Fujiwaranomichinaga.jpg'),
  ChatUser(
      uid: 'Fujiwara-no-Yorimichi',
      userName: '藤原頼通',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Fujiwara_Yorimichi.JPG/200px-Fujiwara_Yorimichi.JPG'),
  ChatUser(
      uid: 'gosanjo-tenno',
      userName: '後三条天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Emperor_Gosanj%C5%8D.jpg/225px-Emperor_Gosanj%C5%8D.jpg'),
  ChatUser(
      uid: 'Shirakawa-Emperor',
      userName: '白河天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Emperor_Shirakawa.jpg/250px-Emperor_Shirakawa.jpg'),
  ChatUser(
      uid: 'Minamoto-no-Yoshie',
      userName: '源義家',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Minamoto_no_Yoshiie.jpg/250px-Minamoto_no_Yoshiie.jpg'),
  ChatUser(
      uid: 'Taira-no-Kiyomori',
      userName: '平清盛',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Taira_no_Kiyomori%2CTenshiSekkanMiei.jpg/270px-Taira_no_Kiyomori%2CTenshiSekkanMiei.jpg'),
  ChatUser(
      uid: 'Minamoto-no-Yoshitomo',
      userName: '源義朝',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/%E5%85%83%E5%B9%B3%E6%B2%BB%E5%90%88%E6%88%A6%E6%BA%90%E7%BE%A9%E6%9C%9D%E7%99%BD%E6%B2%B3%E6%AE%BF%E5%A4%9C%E8%A8%8E%E4%B9%8B%E5%9B%B3.jpg/200px-%E5%85%83%E5%B9%B3%E6%B2%BB%E5%90%88%E6%88%A6%E6%BA%90%E7%BE%A9%E6%9C%9D%E7%99%BD%E6%B2%B3%E6%AE%BF%E5%A4%9C%E8%A8%8E%E4%B9%8B%E5%9B%B3.jpg'),
  ChatUser(
      uid: 'goshirakawa-tenno',
      userName: '後白河天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Emperor_Go-Shirakawa2.jpg/270px-Emperor_Go-Shirakawa2.jpg'),
  ChatUser(
      uid: 'Minamoto-Yoshitsune',
      userName: '源義経',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Minamoto_no_Yoshitsune.jpg/250px-Minamoto_no_Yoshitsune.jpg'),
  ChatUser(
      uid: 'Minamoto-no-Yoritomo',
      userName: '源頼朝',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Minamoto_no_Yoritomo.jpg/250px-Minamoto_no_Yoritomo.jpg'),
  ChatUser(
      uid: 'Hojo-Masako',
      userName: '北条政子',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Hojo_Masako.jpg/200px-Hojo_Masako.jpg'),
  ChatUser(
      uid: 'gotoba-tenno',
      userName: '後鳥羽天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Emperor_Go-Toba.jpg/250px-Emperor_Go-Toba.jpg'),
  ChatUser(
      uid: 'Hojo-Yasuji',
      userName: '北条泰時',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/YASUTOKI_NISHIKI.PNG/250px-YASUTOKI_NISHIKI.PNG'),
  ChatUser(
      uid: 'Hojo-Tokiyori',
      userName: '北条時頼',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/H%C5%8Dj%C5%8D_Tokiyori.jpg/170px-H%C5%8Dj%C5%8D_Tokiyori.jpg'),
  ChatUser(
      uid: 'Hojo-Tokimune',
      userName: '北条時宗',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/H%C5%8Dj%C5%8D_Tokimune.jpg/200px-H%C5%8Dj%C5%8D_Tokimune.jpg'),
  ChatUser(
      uid: 'kubilai',
      userName: 'クビライ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/YuanEmperorAlbumKhubilaiPortrait.jpg/250px-YuanEmperorAlbumKhubilaiPortrait.jpg'),
  ChatUser(
      uid: 'godaigo-tenno',
      userName: '後醍醐天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Emperor_Godaigo.jpg/250px-Emperor_Godaigo.jpg'),
  ChatUser(
      uid: 'Kusunoki-Masanari',
      userName: '楠木正成',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Kusunoki_Masashige.jpg/230px-Kusunoki_Masashige.jpg'),
  ChatUser(
      uid: 'Nitta-Yoshisada',
      userName: '新田義貞',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/%E6%96%B0%E7%94%B0%E7%BE%A9%E8%B2%9E%E5%85%AC%E8%82%96%E5%83%8F.jpg/250px-%E6%96%B0%E7%94%B0%E7%BE%A9%E8%B2%9E%E5%85%AC%E8%82%96%E5%83%8F.jpg'),
  ChatUser(
      uid: 'Ashikaga-Takauji',
      userName: '足利尊氏',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Ashikaga_Takauji_J%C5%8Ddo-ji.jpg/250px-Ashikaga_Takauji_J%C5%8Ddo-ji.jpg'),
  ChatUser(
      uid: 'Ashikaga-Yoshimitsu',
      userName: '足利義満',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Yoshimitsu_Ashikaga_cropped.jpg/250px-Yoshimitsu_Ashikaga_cropped.jpg'),
  ChatUser(
      uid: 'Zeami',
      userName: '世阿弥',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/2/28/Zo%27onna_Noh_Mask%2C_Edo_period%2C_18th_century%2C_wood_with_polychromy_-_Tokyo_National_Museum_-_DSC06166.JPG'),
  ChatUser(
      uid: 'Ashikaga-Yoshimasa',
      userName: '足利義政',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Ashikaga_Yoshimasa.jpg/260px-Ashikaga_Yoshimasa.jpg'),
  ChatUser(
      uid: 'sessyu',
      userName: '雪舟',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Portrait_of_Sesshu.jpg/220px-Portrait_of_Sesshu.jpg'),
  ChatUser(
      uid: 'Ikkyu-Soujun',
      userName: '一休宗純',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/4/40/Portrait_of_Ikky%C5%AB_by_Bokusai.jpg'),
  ChatUser(
      uid: 'Francisco-Xavier',
      userName: 'フランシスコ・ザビエル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Franciscus_de_Xabier.jpg/250px-Franciscus_de_Xabier.jpg'),
  ChatUser(
      uid: 'Houjou-Soun',
      userName: '北条早雲',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Soun_Hojo_portrait.jpg/250px-Soun_Hojo_portrait.jpg'),
  ChatUser(
      uid: 'Doso-Saito',
      userName: '斎藤道三',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Saito-Dozan-2.jpg/230px-Saito-Dozan-2.jpg'),
  ChatUser(
      uid: 'Mori-Motoki',
      userName: '毛利元就',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Mori_Motonari.jpg/250px-Mori_Motonari.jpg'),
  ChatUser(
      uid: 'Takeda-Shingen',
      userName: '武田信玄',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Takeda_Harunobu.jpg/250px-Takeda_Harunobu.jpg'),
  ChatUser(
      uid: 'Kenshin-Uesugi',
      userName: '上杉謙信',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Uesugi_Kenshin_Portrait_from_Uesugi_Shrine.png/250px-Uesugi_Kenshin_Portrait_from_Uesugi_Shrine.png'),
  ChatUser(
      uid: 'Oda-Nobunaga',
      userName: '織田信長',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Oda-Nobunaga.jpg/250px-Oda-Nobunaga.jpg'),
  ChatUser(
      uid: 'Ashikaga-Yoshiaki',
      userName: '足利義昭',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Ashikaga_Yoshiaki.jpg/260px-Ashikaga_Yoshiaki.jpg'),
  ChatUser(
      uid: 'Akechi-Mitsuhide',
      userName: '明智光秀',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Akechi_Mitsuhide2.jpg/250px-Akechi_Mitsuhide2.jpg'),
  ChatUser(
      uid: 'Toyotomi-Hideyoshi',
      userName: '豊臣秀吉',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Toyotomi_Hideyoshi_c1598_Kodai-ji_Temple.png/250px-Toyotomi_Hideyoshi_c1598_Kodai-ji_Temple.png'),
  ChatUser(
      uid: 'Senriku-Rikyuu',
      userName: '千利休',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Sen_no_Rikyu_JPN.jpg/200px-Sen_no_Rikyu_JPN.jpg'),
  ChatUser(
      uid: 'Ishida-Mitsunari',
      userName: '石田三成',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Ishida_Mitsunari.jpg/250px-Ishida_Mitsunari.jpg'),
  ChatUser(
      uid: 'Hideyori-Toyotomi-Hideyori',
      userName: '豊臣秀頼',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Hideyori_Toyotomi.jpg/250px-Hideyori_Toyotomi.jpg'),
  ChatUser(
      uid: 'Date-Masamune',
      userName: '伊達政宗',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Date_Masamune02.jpg/280px-Date_Masamune02.jpg'),
  ChatUser(
      uid: 'Tokugawa-Ieyasu',
      userName: '徳川家康',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Tokugawa_Ieyasu2.JPG/270px-Tokugawa_Ieyasu2.JPG'),
  ChatUser(
      uid: 'Tokugawa-Iemitsu',
      userName: '徳川家光',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Iemitu.jpg/250px-Iemitu.jpg'),
  ChatUser(
      uid: 'Shiro-Amakusa',
      userName: '天草四郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Amakusa_Shiro.jpg/220px-Amakusa_Shiro.jpg'),
  ChatUser(
      uid: 'Tsunayoshi-Tokugawa',
      userName: '徳川綱吉',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Tsunyaoshi.jpg/250px-Tsunyaoshi.jpg'),
  ChatUser(
      uid: 'Arai-Hakuseki',
      userName: '新井白石',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Arai_Hakuseki_-_Japanischer_Gelehrter.jpg/250px-Arai_Hakuseki_-_Japanischer_Gelehrter.jpg'),
  ChatUser(
      uid: 'Yoshimune-Tokugawa',
      userName: '徳川吉宗',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Tokugawa_Yoshimune.jpg/260px-Tokugawa_Yoshimune.jpg'),
  ChatUser(
      uid: 'Ooka-Tadasama',
      userName: '大岡忠相',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Oooka_tadasuke.jpg/250px-Oooka_tadasuke.jpg'),
  ChatUser(
      uid: 'Motoori-Nobunaga',
      userName: '本居宣長',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Motoori_Norinaga_self_portrait.jpg/230px-Motoori_Norinaga_self_portrait.jpg'),
  ChatUser(
      uid: 'Tanuma-Okitsugu',
      userName: '田沼意次',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Tanuma_Okitsugu2.jpg/250px-Tanuma_Okitsugu2.jpg'),
  ChatUser(
      uid: 'Matsudaira-Sadanobu',
      userName: '松平定信',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Matsudaira_Sadanobu.jpg/250px-Matsudaira_Sadanobu.jpg'),
  ChatUser(
      uid: 'Heihachiro-Oshio',
      userName: '大塩平八郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Oshio_Heihachiro.jpg/250px-Oshio_Heihachiro.jpg'),
  ChatUser(
      uid: 'Tadakuni-Mizuno',
      userName: '水野忠邦',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Mizuno_Tadakuni.jpg/300px-Mizuno_Tadakuni.jpg'),
  ChatUser(
      uid: 'Matthew-Perry',
      userName: 'マシュー・ペリー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Commodore_Matthew_Calbraith_Perry.png/250px-Commodore_Matthew_Calbraith_Perry.png'),
  ChatUser(
      uid: 'Ii-Naosuke',
      userName: '井伊直弼',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Ii_Naosuke.jpg/250px-Ii_Naosuke.jpg'),
  ChatUser(
      uid: 'Yoshida-Shoi',
      userName: '吉田松陰',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Yoshida_Shoin2.jpg/250px-Yoshida_Shoin2.jpg'),
  ChatUser(
      uid: 'Tokachi-Kaisyu',
      userName: '勝海舟',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Kaishu_Katsu_2.jpg/200px-Kaishu_Katsu_2.jpg'),
  ChatUser(
      uid: 'Shimazu-Nariakira',
      userName: '島津斉彬',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Nariakira_Shimazu.png/200px-Nariakira_Shimazu.png'),
  ChatUser(
      uid: 'Sakamoto-Ryoma',
      userName: '坂本龍馬',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Sakamoto_Ryoma.jpg/250px-Sakamoto_Ryoma.jpg'),
  ChatUser(
      uid: 'Keiki-Tokugawa',
      userName: '徳川慶喜',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/YoshinobuTokugawa.jpg/200px-YoshinobuTokugawa.jpg'),
  ChatUser(
      uid: 'Emperor-Meiji',
      userName: '明治天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Emperor_Meiji_in_1873.jpg/230px-Emperor_Meiji_in_1873.jpg'),
  ChatUser(
      uid: 'Okubo-Toshimichi',
      userName: '大久保利通',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Toshimichi_Okubo_4.jpg/200px-Toshimichi_Okubo_4.jpg'),
  ChatUser(
      uid: 'Kido-Kouyoshi',
      userName: '木戸孝允',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Takayoshi_Kido_suit.jpg/500px-Takayoshi_Kido_suit.jpg'),
  ChatUser(
      uid: 'Saigo-Takamori',
      userName: '西郷隆盛',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Saigo_Takamori_Portrait_by_Ishikawa_Shizumasa.jpg/250px-Saigo_Takamori_Portrait_by_Ishikawa_Shizumasa.jpg'),
  ChatUser(
      uid: 'Tomomi-Iwakura',
      userName: '岩倉具視',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Tomomi_Iwakura_3.jpg/220px-Tomomi_Iwakura_3.jpg'),
  ChatUser(
      uid: 'Hirobumi-Ito',
      userName: '伊藤博文',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/IT%C5%8C_Hirobumi.jpg/220px-IT%C5%8C_Hirobumi.jpg'),
  ChatUser(
      uid: 'Fukuzawa-Yukichi',
      userName: '福沢諭吉',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Yukichi_Fukuzawa_1891.jpg/200px-Yukichi_Fukuzawa_1891.jpg'),
  ChatUser(
      uid: 'Itagaki-Tasuke',
      userName: '板垣退助',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/ITAGAKI_Taisuke.jpg/220px-ITAGAKI_Taisuke.jpg'),
  ChatUser(
      uid: 'Shigenobu-Okuma',
      userName: '大隈重信',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Shigenobu_Okuma_5.jpg/220px-Shigenobu_Okuma_5.jpg'),
  ChatUser(
      uid: 'Mutsu-Munemitsu',
      userName: '陸奥宗光',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Mutsu_Munemitsu.jpg/200px-Mutsu_Munemitsu.jpg'),
  ChatUser(
      uid: 'Kotaro-Komura',
      userName: '小村寿太郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Komura_Jutaro.jpg/200px-Komura_Jutaro.jpg'),
  ChatUser(
      uid: 'Heihachiro-Togo',
      userName: '東郷平八郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/T%C5%8Dg%C5%8D_Heihachir%C5%8D.jpg/260px-T%C5%8Dg%C5%8D_Heihachir%C5%8D.jpg'),
  ChatUser(
      uid: 'Kiyoshi-Shiga',
      userName: '志賀潔',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Kiyoshi_Shiga.jpg/220px-Kiyoshi_Shiga.jpg'),
  ChatUser(
      uid: 'Tanaka-Shozo',
      userName: '田中正造',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Tanaka_Shozo.jpg/200px-Tanaka_Shozo.jpg'),
  ChatUser(
      uid: 'Saionji-Kinmoti',
      userName: '西園寺公望',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Kinmochi_Saionji_2.jpg/220px-Kinmochi_Saionji_2.jpg'),
  ChatUser(
      uid: 'Hideyo-Noguchi',
      userName: '野口英世',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Noguchi_Hideyo.jpg/225px-Noguchi_Hideyo.jpg'),
  ChatUser(
      uid: 'Yukio-Ozaki',
      userName: '尾崎行雄',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Yukio_Ozaki.jpg/250px-Yukio_Ozaki.jpg'),
  ChatUser(
      uid: 'original-salutation',
      userName: '原敬',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Takashi_Hara_formal.jpg/220px-Takashi_Hara_formal.jpg'),
  ChatUser(
      uid: 'Takeshi-Inuyo',
      userName: '犬養毅',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Inukai_Tsuyoshi.jpg/220px-Inukai_Tsuyoshi.jpg'),
  ChatUser(
      uid: 'Isoroku-Yamamoto',
      userName: '山本五十六',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Portrait_of_Yamamoto_Isoroku.jpg/255px-Portrait_of_Yamamoto_Isoroku.jpg'),
  ChatUser(
      uid: 'Douglas-MacArthur.',
      userName: 'ダグラス・マッカーサー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/MacArthur_Manila.jpg/240px-MacArthur_Manila.jpg'),
  ChatUser(
      uid: 'Shigeru-Yoshida',
      userName: '吉田茂',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Shigeru_Yoshida_suit.jpg/200px-Shigeru_Yoshida_suit.jpg'),
  ChatUser(
      uid: 'George-Barkley.',
      userName: 'ジョージ・バークリー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/George_Berkeley_by_John_Smibert.jpg/200px-George_Berkeley_by_John_Smibert.jpg'),
  ChatUser(
      uid: 'Benjamin-Franklin.',
      userName: 'ベンジャミン・フランクリン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/BenFranklinDuplessis.jpg/200px-BenFranklinDuplessis.jpg'),
  ChatUser(
      uid: 'Helen-Keller.',
      userName: 'ヘレン・ケラー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Helen_KellerA.jpg/220px-Helen_KellerA.jpg'),
  ChatUser(
      uid: 'John-F-Kennedy',
      userName: 'ジョン・F・ケネディ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/John_F._Kennedy%2C_White_House_color_photo_portrait.jpg/220px-John_F._Kennedy%2C_White_House_color_photo_portrait.jpg'),
  ChatUser(
      uid: 'Martin-Luther-King-Jr',
      userName: 'マーティン・ルーサー・キング・ジュニア',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Martin_Luther_King_Jr_NYWTS.jpg/300px-Martin_Luther_King_Jr_NYWTS.jpg'),
  ChatUser(
      uid: 'Franklin-D-Roosevelt.',
      userName: 'フランクリン・ルーズベルト',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/FDR_1944_Color_Portrait.jpg/250px-FDR_1944_Color_Portrait.jpg'),
  ChatUser(
      uid: 'Che-Guevara',
      userName: 'チェ・ゲバラ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/CheHigh.jpg/200px-CheHigh.jpg'),
  ChatUser(
      uid: 'Victoria',
      userName: 'ヴィクトリア (イギリス女王)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Queen_Victoria_-Golden_Jubilee_-3a_cropped.JPG/200px-Queen_Victoria_-Golden_Jubilee_-3a_cropped.JPG'),
  ChatUser(
      uid: 'Florence-Nightingale',
      userName: 'フローレンス・ナイチンゲール',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Florence_Nightingale_CDV_by_H_Lenthall.jpg/220px-Florence_Nightingale_CDV_by_H_Lenthall.jpg'),
  ChatUser(
      uid: 'William-Shakespeare.',
      userName: 'ウィリアム・シェイクスピア',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/CHANDOS3.jpg/200px-CHANDOS3.jpg'),
  ChatUser(
      uid: 'Winston-Churchill',
      userName: 'ウィンストン・チャーチル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Sir_Winston_Churchill_-_19086236948.jpg/400px-Sir_Winston_Churchill_-_19086236948.jpg'),
  ChatUser(
      uid: 'Charles-Chaplin.',
      userName: 'チャールズ・チャップリン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Charlie_Chaplin_portrait.jpg/220px-Charlie_Chaplin_portrait.jpg'),
  ChatUser(
      uid: 'Arthur-Conan-Doyle',
      userName: 'アーサー・コナン・ドイル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Conan_doyle.jpg/250px-Conan_doyle.jpg'),
  ChatUser(
      uid: 'Adam-Smith',
      userName: 'アダム・スミス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/AdamSmith.jpg/200px-AdamSmith.jpg'),
  ChatUser(
      uid: 'Michelangelo-Buonarroti',
      userName: 'ミケランジェロ・ブオナローティ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Miguel_%C3%81ngel%2C_por_Daniele_da_Volterra_%28detalle%29.jpg/220px-Miguel_%C3%81ngel%2C_por_Daniele_da_Volterra_%28detalle%29.jpg'),
  ChatUser(
      uid: 'Raffaello-Santi',
      userName: 'ラファエロ・サンティ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Raffaello_Sanzio.jpg/220px-Raffaello_Sanzio.jpg'),
  ChatUser(
      uid: 'Sandro-Botticelli',
      userName: 'サンドロ・ボッティチェッリ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Sandro_Botticelli_083.jpg/220px-Sandro_Botticelli_083.jpg'),
  ChatUser(
      uid: 'Benito-Mussolini',
      userName: 'ベニート・ムッソリーニ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Mussolini_biografia.jpg/220px-Mussolini_biografia.jpg'),
  ChatUser(
      uid: 'Dante-Alighieri.',
      userName: 'ダンテ・アリギエーリ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Portrait_de_Dante.jpg/200px-Portrait_de_Dante.jpg'),
  ChatUser(
      uid: 'Lorenzo-de-Medici',
      userName: 'ロレンツォ・デ・メディチ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Lorenzo_de%27_Medici-ritratto.jpg/400px-Lorenzo_de%27_Medici-ritratto.jpg'),
  ChatUser(
      uid: 'Pietro-Mascagni',
      userName: 'ピエトロ・マスカーニ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Pietro_Mascagni_2.jpg/220px-Pietro_Mascagni_2.jpg'),
  ChatUser(
      uid: 'Tintoretto',
      userName: 'ティントレット',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Tintorettoselfportrait.jpg/250px-Tintorettoselfportrait.jpg'),
  ChatUser(
      uid: 'Michelangelo-Merisi-da-Caravaggio',
      userName: 'ミケランジェロ・メリージ・ダ・カラヴァッジオ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Bild-Ottavio_Leoni%2C_Caravaggio.jpg/200px-Bild-Ottavio_Leoni%2C_Caravaggio.jpg'),
  ChatUser(
      uid: 'Filippo-Lippi',
      userName: 'フィリッポ・リッピ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Fra_Filippo_Lippi_007.1.jpg/220px-Fra_Filippo_Lippi_007.1.jpg'),
  ChatUser(
      uid: 'Girolamo-Savonarola',
      userName: 'ジロラモ・サヴォナローラ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/GirolamoSavonarola.jpg/200px-GirolamoSavonarola.jpg'),
  ChatUser(
      uid: 'Paolo-Veronese',
      userName: 'パオロ・ヴェロネーゼ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Paolo_Veronese%2C_avtoportret.jpg/220px-Paolo_Veronese%2C_avtoportret.jpg'),
  ChatUser(
      uid: 'Giorgio-Vasari',
      userName: 'ジョルジョ・ヴァザーリ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Giorgio_Vasari_Selbstportr%C3%A4t.jpg/220px-Giorgio_Vasari_Selbstportr%C3%A4t.jpg'),
  ChatUser(
      uid: 'Moses',
      userName: 'モーセ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Moses_%28Michaelangelo_-_San_Pietro_in_Vincoli_-_Rome%29.jpg/250px-Moses_%28Michaelangelo_-_San_Pietro_in_Vincoli_-_Rome%29.jpg'),
  ChatUser(
      uid: 'Richard-I',
      userName: 'リチャード1世 (イングランド王)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/4/49/Richard_coeurdelion_g.jpg'),
  ChatUser(
      uid: 'Elizabeth-I',
      userName: 'エリザベス1世 (イングランド女王)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Elizabeth1England.jpg/250px-Elizabeth1England.jpg'),
  ChatUser(
      uid: 'Oliver-Cromwell',
      userName: 'オリバー・クロムウェル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Oliver_Cromwell_by_Samuel_Cooper.jpg/220px-Oliver_Cromwell_by_Samuel_Cooper.jpg'),
  ChatUser(
      uid: 'King-Ashoka',
      userName: 'アショーカ王',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Indian_relief_from_Amaravati%2C_Guntur._Preserved_in_Guimet_Museum.jpg/200px-Indian_relief_from_Amaravati%2C_Guntur._Preserved_in_Guimet_Museum.jpg'),
  ChatUser(
      uid: 'Mahatma-Gandhi',
      userName: 'マハトマ・ガンディー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Portrait_Gandhi.jpg/250px-Portrait_Gandhi.jpg'),
  ChatUser(
      uid: 'Shakyamuni',
      userName: '釈迦',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Buddha_in_Sarnath_Museum_%28Dhammajak_Mutra%29.jpg/240px-Buddha_in_Sarnath_Museum_%28Dhammajak_Mutra%29.jpg'),
  ChatUser(
      uid: 'Marco-Polo',
      userName: 'マルコ・ポーロ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Marco_Polo_portrait.jpg/220px-Marco_Polo_portrait.jpg'),
  ChatUser(
      uid: 'Ramses-II',
      userName: 'ラムセス2世',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/RamsesIIEgypt.jpg/220px-RamsesIIEgypt.jpg'),
  ChatUser(
      uid: 'Salahuddin',
      userName: 'サラーフッディーン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Portrait_of_Saladin_%28before_A.D._1185%3B_short%29.jpg/225px-Portrait_of_Saladin_%28before_A.D._1185%3B_short%29.jpg'),
  ChatUser(
      uid: 'kufu',
      userName: 'クフ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Kairo_Museum_Statuette_Cheops_03_%28cropped%29.jpg/220px-Kairo_Museum_Statuette_Cheops_03_%28cropped%29.jpg'),
  ChatUser(
      uid: 'Eliezabeth',
      userName: 'エリーザベト (オーストリア皇后)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Erzsebet_kiralyne_photo_1867.jpg/200px-Erzsebet_kiralyne_photo_1867.jpg'),
  ChatUser(
      uid: 'Sigmund-Freud.',
      userName: 'ジークムント・フロイト',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Sigmund_Freud_LIFE.jpg/225px-Sigmund_Freud_LIFE.jpg'),
  ChatUser(
      uid: 'Maria-Theresa',
      userName: 'マリア・テレジア',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Kaiserin_Maria_Theresia_%28HRR%29.jpg/220px-Kaiserin_Maria_Theresia_%28HRR%29.jpg'),
  ChatUser(
      uid: 'Franz-Joseph-Haydn',
      userName: 'フランツ・ヨーゼフ・ハイドン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Haydn_portrait_by_Thomas_Hardy_%28small%29.jpg/220px-Haydn_portrait_by_Thomas_Hardy_%28small%29.jpg'),
  ChatUser(
      uid: 'Wolfgang-Amadeus-Mozart',
      userName: 'ヴォルフガング・アマデウス・モーツァルト',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Wolfgang-amadeus-mozart_1.jpg/200px-Wolfgang-amadeus-mozart_1.jpg'),
  ChatUser(
      uid: 'Anton-Bruckner.',
      userName: 'アントン・ブルックナー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Bruckner_final_years.jpg/220px-Bruckner_final_years.jpg'),
  ChatUser(
      uid: 'Johann-Strauss-II',
      userName: 'ヨハン・シュトラウス2世',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Johann_Strauss_II_1890.jpg/220px-Johann_Strauss_II_1890.jpg'),
  ChatUser(
      uid: 'Vincent-van-Gogh',
      userName: 'フィンセント・ファン・ゴッホ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/VanGogh_1887_Selbstbildnis.jpg/250px-VanGogh_1887_Selbstbildnis.jpg'),
  ChatUser(
      uid: 'Barouf-de-Spinoza.',
      userName: 'バールーフ・デ・スピノザ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Spinoza.jpg/200px-Spinoza.jpg'),
  ChatUser(
      uid: 'Suleiman-I',
      userName: 'スレイマン1世',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/EmperorSuleiman.jpg/200px-EmperorSuleiman.jpg'),
  ChatUser(
      uid: 'Hannibal',
      userName: 'ハンニバル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Hannibal_Slodtz_Louvre_MR2093.jpg/200px-Hannibal_Slodtz_Louvre_MR2093.jpg'),
  ChatUser(
      uid: 'Alexander-III',
      userName: 'アレクサンドロス3世',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Istanbul_-_Museo_archeol._-_Alessandro_Magno_%28firmata_Menas%29_-_sec._III_a.C._-_da_Magnesia_-_Foto_G._Dall%27Orto_28-5-2006_b-n.jpg/200px-Istanbul_-_Museo_archeol._-_Alessandro_Magno_%28firmata_Menas%29_-_sec._III_a.C._-_da_Magnesia_-_Foto_G._Dall%27Orto_28-5-2006_b-n.jpg'),
  ChatUser(
      uid: 'Felipe-II',
      userName: 'フェリペ2世 (スペイン王)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/King_PhilipII_of_Spain.jpg/200px-King_PhilipII_of_Spain.jpg'),
  ChatUser(
      uid: 'Francisco-Pizarro',
      userName: 'フランシスコ・ピサロ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Pizarro.jpg/250px-Pizarro.jpg'),
  ChatUser(
      uid: 'Hernan-Cortez.',
      userName: 'エルナン・コルテス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Retrato_de_Hern%C3%A1n_Cort%C3%A9s.jpg/220px-Retrato_de_Hern%C3%A1n_Cort%C3%A9s.jpg'),
  ChatUser(
      uid: 'Francisco-de-Goya',
      userName: 'フランシスコ・デ・ゴヤ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Vicente_L%C3%B3pez_Porta%C3%B1a_-_el_pintor_Francisco_de_Goya.jpg/220px-Vicente_L%C3%B3pez_Porta%C3%B1a_-_el_pintor_Francisco_de_Goya.jpg'),
  ChatUser(
      uid: 'Pablo-Picasso',
      userName: 'パブロ・ピカソ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Pablo_picasso_1.jpg/230px-Pablo_picasso_1.jpg'),
  ChatUser(
      uid: 'Christina',
      userName: 'クリスティーナ (スウェーデン女王)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/David_Beck_-_Christina%2C_Queen_of_Sweden_1644-1654_-_Google_Art_Project.jpg/400px-David_Beck_-_Christina%2C_Queen_of_Sweden_1644-1654_-_Google_Art_Project.jpg'),
  ChatUser(
      uid: 'Carl-Zumberg',
      userName: 'カール・ツンベルク',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/f/f5/Carl_Peter_Thunberg.jpg'),
  ChatUser(
      uid: 'Vladimir-Lenin',
      userName: 'ウラジーミル・レーニン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Vladimir_Lenin.jpg/200px-Vladimir_Lenin.jpg'),
  ChatUser(
      uid: 'Joseph-Stalin',
      userName: 'ヨシフ・スターリン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Josef_Stalin_-_NARA_-_198797.jpg/220px-Josef_Stalin_-_NARA_-_198797.jpg'),
  ChatUser(
      uid: 'Yuriy-Gagarin',
      userName: 'ユーリイ・ガガーリン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/c/cc/Gagarin_in_Sweden.jpg'),
  ChatUser(
      uid: 'Kanu',
      userName: '関羽',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Guanyu.jpg/200px-Guanyu.jpg'),
  ChatUser(
      uid: 'Zhang-Liang',
      userName: '張良',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Zhang_Liang.jpg/220px-Zhang_Liang.jpg'),
  ChatUser(
      uid: 'Cao-Cao',
      userName: '曹操',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Cao_Cao_scth.jpg/220px-Cao_Cao_scth.jpg'),
  ChatUser(
      uid: 'Liu-Bei',
      userName: '劉備',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Liu_Bei_Tang.jpg/170px-Liu_Bei_Tang.jpg'),
  ChatUser(
      uid: 'Sun-Quan',
      userName: '孫権',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Sun_Quan_Tang.jpg/240px-Sun_Quan_Tang.jpg'),
  ChatUser(
      uid: 'Genjo',
      userName: '玄奘',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Xuanzang_w.jpg/150px-Xuanzang_w.jpg'),
  ChatUser(
      uid: 'Yi-Paikou',
      userName: '李白',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Libai_touxiang.jpg/200px-Libai_touxiang.jpg'),
  ChatUser(
      uid: 'Shiba-Sangon',
      userName: '司馬遷',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Si_maqian.jpg/220px-Si_maqian.jpg'),
  ChatUser(
      uid: 'Confucius',
      userName: '孔子',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/2/2d/Confucius_02.png'),
  ChatUser(
      uid: 'Qin-Shi-Huang',
      userName: '秦始皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Qinshihuang.jpg/320px-Qinshihuang.jpg'),
  ChatUser(
      uid: 'Zhu-Yuanzhang.',
      userName: '朱元璋',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/%E6%98%8E%E5%A4%AA%E7%A5%96%E7%94%BB%E5%83%8F.jpg/200px-%E6%98%8E%E5%A4%AA%E7%A5%96%E7%94%BB%E5%83%8F.jpg'),
  ChatUser(
      uid: 'To-Fu',
      userName: '杜甫',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Du_Fu.jpg/250px-Du_Fu.jpg'),
  ChatUser(
      uid: 'Sun-Yat-sen',
      userName: '孫文',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Sun_Yat-sen_2.jpg/400px-Sun_Yat-sen_2.jpg'),
  ChatUser(
      uid: 'Mao-Zedong',
      userName: '毛沢東',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Mao_Zedong_1959.jpg/220px-Mao_Zedong_1959.jpg'),
  ChatUser(
      uid: 'Richard-Wagner',
      userName: 'リヒャルト・ワーグナー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/RichardWagner.jpg/220px-RichardWagner.jpg'),
  ChatUser(
      uid: 'Martin-Luther',
      userName: 'マルティン・ルター',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Lucas_Cranach_%28I%29_workshop_-_Martin_Luther_%28Uffizi%29.jpg/200px-Lucas_Cranach_%28I%29_workshop_-_Martin_Luther_%28Uffizi%29.jpg'),
  ChatUser(
      uid: 'Johann-Sebastian-Bach',
      userName: 'ヨハン・ゼバスティアン・バッハ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Johann_Sebastian_Bach.png/200px-Johann_Sebastian_Bach.png'),
  ChatUser(
      uid: 'Ludwig-van-Beethoven',
      userName: 'ルートヴィヒ・ヴァン・ベートーヴェン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Beethoven.jpg/200px-Beethoven.jpg'),
  ChatUser(
      uid: 'Karl-Marx',
      userName: 'カール・マルクス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Marx7.jpg/200px-Marx7.jpg'),
  ChatUser(
      uid: 'Immanuel-Canto.',
      userName: 'イマヌエル・カント',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Kant_gemaelde_1.jpg/250px-Kant_gemaelde_1.jpg'),
  ChatUser(
      uid: 'Georg-Wilhelm-Friedrich-Hegel',
      userName: 'ゲオルク・ヴィルヘルム・フリードリヒ・ヘーゲル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Hegel_portrait_by_Schlesinger_1831.jpg/200px-Hegel_portrait_by_Schlesinger_1831.jpg'),
  ChatUser(
      uid: 'Friedrich-Nietzsche',
      userName: 'フリードリヒ・ニーチェ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Nietzsche1882.jpg/200px-Nietzsche1882.jpg'),
  ChatUser(
      uid: 'Artur-Schopenhauer',
      userName: 'アルトゥル・ショーペンハウアー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Arthur_Schopenhauer_Portrait_by_Ludwig_Sigismund_Ruhl_1815.jpeg/240px-Arthur_Schopenhauer_Portrait_by_Ludwig_Sigismund_Ruhl_1815.jpeg'),
  ChatUser(
      uid: 'Engelbert-Kempel',
      userName: 'エンゲルベルト・ケンペル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Engelbert_Kaempfer.jpg/115px-Engelbert_Kaempfer.jpg'),
  ChatUser(
      uid: 'Anne-Frank',
      userName: 'アンネ・フランク',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/AnneFrankSchoolPhoto.jpg/220px-AnneFrankSchoolPhoto.jpg'),
  ChatUser(
      uid: 'Felix-Mendelssohn',
      userName: 'フェリックス・メンデルスゾーン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Mendelssohn_Bartholdy.jpg/220px-Mendelssohn_Bartholdy.jpg'),
  ChatUser(
      uid: 'Carl-Maria-von-Weber',
      userName: 'カール・マリア・フォン・ウェーバー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Carl_Maria_von_Weber.jpg/220px-Carl_Maria_von_Weber.jpg'),
  ChatUser(
      uid: 'Justinian-I',
      userName: 'ユスティニアヌス1世',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Meister_von_San_Vitale_in_Ravenna.jpg/200px-Meister_von_San_Vitale_in_Ravenna.jpg'),
  ChatUser(
      uid: 'Gaius-Julius-Caesar',
      userName: 'ガイウス・ユリウス・カエサル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Julius_Caesar_Coustou_Louvre_MR1798.jpg/500px-Julius_Caesar_Coustou_Louvre_MR1798.jpg'),
  ChatUser(
      uid: 'Jean-Sibelius',
      userName: 'ジャン・シベリウス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Jean_Sibelius%2C_1913.jpg/220px-Jean_Sibelius%2C_1913.jpg'),
  ChatUser(
      uid: "Jeanne-d-Arc",
      userName: 'ジャンヌ・ダルク',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Joan_of_Arc_miniature_graded.jpg/250px-Joan_of_Arc_miniature_graded.jpg'),
  ChatUser(
      uid: 'Charles-VII',
      userName: 'シャルル7世 (フランス王)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/KarlVII.jpg/200px-KarlVII.jpg'),
  ChatUser(
      uid: 'Louis-XIV',
      userName: 'ルイ14世 (フランス王)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Louis_XIV_of_France.jpg/200px-Louis_XIV_of_France.jpg'),
  ChatUser(
      uid: 'Marie-Antoinette.',
      userName: 'マリー・アントワネット',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Vig%C3%A9e-Lebrun_Marie_Antoinette_1783.jpg/200px-Vig%C3%A9e-Lebrun_Marie_Antoinette_1783.jpg'),
  ChatUser(
      uid: 'Napoleon-Bonaparte.',
      userName: 'ナポレオン・ボナパルト',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Fran%C3%A7ois_G%C3%A9rard_-_Napoleon_I_001.JPG/200px-Fran%C3%A7ois_G%C3%A9rard_-_Napoleon_I_001.JPG'),
  ChatUser(
      uid: 'Jean-Jacques-Rousseau',
      userName: 'ジャン＝ジャック・ルソー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Jean-Jacques_Rousseau_%28painted_portrait%29.jpg/200px-Jean-Jacques_Rousseau_%28painted_portrait%29.jpg'),
  ChatUser(
      uid: 'Coco-Chanel',
      userName: 'ココ・シャネル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Coco_Chanel_in_Los_Angeles%2C_1931_%28cropped%29.jpg/180px-Coco_Chanel_in_Los_Angeles%2C_1931_%28cropped%29.jpg'),
  ChatUser(
      uid: 'Claude-Debussy',
      userName: 'クロード・ドビュッシー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Claude_Debussy_ca_1908%2C_foto_av_F%C3%A9lix_Nadar.jpg/220px-Claude_Debussy_ca_1908%2C_foto_av_F%C3%A9lix_Nadar.jpg'),
  ChatUser(
      uid: 'Georges-Bizet',
      userName: 'ジョルジュ・ビゼー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Georges_bizet.jpg/220px-Georges_bizet.jpg'),
  ChatUser(
      uid: 'Ector-Berlioz.',
      userName: 'エクトル・ベルリオーズ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Hector_berlioz.jpg/220px-Hector_berlioz.jpg'),
  ChatUser(
      uid: 'Jules-Massenet',
      userName: 'ジュール・マスネ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Jules_massenet.jpg/220px-Jules_massenet.jpg'),
  ChatUser(
      uid: 'Eric-Satie',
      userName: 'エリック・サティ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Ericsatie.jpg/220px-Ericsatie.jpg'),
  ChatUser(
      uid: 'Gabriel-Foret',
      userName: 'ガブリエル・フォーレ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Gabriel_Faur%C3%A9_Paul_Nadar_1905.JPG/220px-Gabriel_Faur%C3%A9_Paul_Nadar_1905.JPG'),
  ChatUser(
      uid: 'Henri-Bergson',
      userName: 'アンリ・ベルクソン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Henri_Bergson.jpg/200px-Henri_Bergson.jpg'),
  ChatUser(
      uid: 'Maximilian-Robespierre',
      userName: 'マクシミリアン・ロベスピエール',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Robespierre.jpg/400px-Robespierre.jpg'),
  ChatUser(
      uid: 'Maurice-Ravel',
      userName: 'モーリス・ラヴェル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Maurice_Ravel_1925.jpg/220px-Maurice_Ravel_1925.jpg'),
  ChatUser(
      uid: 'Frederic-Chopin',
      userName: 'フレデリック・ショパン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Frederic_Chopin_photo.jpeg/200px-Frederic_Chopin_photo.jpeg'),
  ChatUser(
      uid: 'Tekla-Badajewska',
      userName: 'テクラ・バダジェフスカ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/B%C4%85darzewska_Gebet_einer_Jungfrau.jpg/440px-B%C4%85darzewska_Gebet_einer_Jungfrau.jpg'),
  ChatUser(
      uid: 'Prince-Enrique-Voyage',
      userName: 'エンリケ航海王子',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Henry_the_Navigator1.jpg/200px-Henry_the_Navigator1.jpg'),
  ChatUser(
      uid: 'Friedrich-II',
      userName: 'フリードリヒ2世 (神聖ローマ皇帝)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Frederick_II_and_eagle.jpg/200px-Frederick_II_and_eagle.jpg'),
  ChatUser(
      uid: 'Mother-Teresa',
      userName: 'マザー・テレサ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/MotherTeresa_090.jpg/200px-MotherTeresa_090.jpg'),
  ChatUser(
      uid: 'Fyodor-Dostoevsky.',
      userName: 'フョードル・ドストエフスキー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Dostoevsky.jpg/200px-Dostoevsky.jpg'),
  ChatUser(
      uid: 'Lev-Tolstoy.',
      userName: 'レフ・トルストイ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/LNTolstoy.jpg/200px-LNTolstoy.jpg'),
  ChatUser(
      uid: 'Yekaterina-II',
      userName: 'エカチェリーナ2世 (ロシア皇帝)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Catherine_II_by_J.B.Lampi_%281780s%2C_Kunsthistorisches_Museum%29.jpg/200px-Catherine_II_by_J.B.Lampi_%281780s%2C_Kunsthistorisches_Museum%29.jpg'),
  ChatUser(
      uid: 'Ivan-IV',
      userName: 'イヴァン4世',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Ivan_grozny_frame.jpg/200px-Ivan_grozny_frame.jpg'),
  ChatUser(
      uid: 'Peter-I',
      userName: 'ピョートル1世 (ロシア皇帝)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Peter_der-Grosse_1838.jpg/250px-Peter_der-Grosse_1838.jpg'),
  ChatUser(
      uid: 'Pyotr-Tchaikovsky',
      userName: 'ピョートル・チャイコフスキー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Tchaikowsky.jpg/200px-Tchaikowsky.jpg'),
  ChatUser(
      uid: 'Karl-the-Great',
      userName: 'カール大帝',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/D%C3%BCrer_karl_der_grosse.jpg/200px-D%C3%BCrer_karl_der_grosse.jpg'),
  ChatUser(
      uid: 'Friedrich-II',
      userName: 'フリードリヒ2世 (プロイセン王)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Friedrich2_jung.jpg/200px-Friedrich2_jung.jpg'),
  ChatUser(
      uid: 'Heinrich-IV',
      userName: 'ハインリヒ4世 (神聖ローマ皇帝)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Heinrich_4_g.jpg/225px-Heinrich_4_g.jpg'),
  ChatUser(
      uid: 'Innocentius-III',
      userName: 'インノケンティウス3世 (ローマ教皇)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Innozenz3.jpg/150px-Innozenz3.jpg'),
  ChatUser(
      uid: 'Augustus',
      userName: 'アウグストゥス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Statue-Augustus.jpg/200px-Statue-Augustus.jpg'),
  ChatUser(
      uid: 'Claudius-Ptolemy.',
      userName: 'クラウディオス・プトレマイオス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/PSM_V78_D326_Ptolemy.png/220px-PSM_V78_D326_Ptolemy.png'),
  ChatUser(
      uid: 'Socrates',
      userName: 'ソクラテス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Socrate_du_Louvre.jpg/200px-Socrate_du_Louvre.jpg'),
  ChatUser(
      uid: 'Plato',
      userName: 'プラトン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Plato.png/200px-Plato.png'),
  ChatUser(
      uid: 'Eratosthenes',
      userName: 'エラトステネス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Eratosthenes.jpg/200px-Eratosthenes.jpg'),
  ChatUser(
      uid: 'Pericles',
      userName: 'ペリクレス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Pericles_Pio-Clementino_Inv269_n2.jpg/200px-Pericles_Pio-Clementino_Inv269_n2.jpg'),
  ChatUser(
      uid: 'acquenaten',
      userName: 'アクエンアテン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/GD-EG-Caire-Mus%C3%A9e061.JPG/220px-GD-EG-Caire-Mus%C3%A9e061.JPG'),
  ChatUser(
      uid: 'Tutankamen',
      userName: 'ツタンカーメン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Tutanchamun_Maske.jpg/220px-Tutanchamun_Maske.jpg'),
  ChatUser(
      uid: 'David',
      userName: 'ダビデ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/David_SM_Maggiore.jpg/200px-David_SM_Maggiore.jpg'),
  ChatUser(
      uid: 'hammurabi',
      userName: 'ハンムラビ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Milkau_Oberer_Teil_der_Stele_mit_dem_Text_von_Hammurapis_Gesetzescode_369-2.jpg/200px-Milkau_Oberer_Teil_der_Stele_mit_dem_Text_von_Hammurapis_Gesetzescode_369-2.jpg'),
  ChatUser(
      uid: 'Shah-Jahan',
      userName: 'シャー・ジャハーン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Shah_Jahan_of_Mughal_empire.jpg/200px-Shah_Jahan_of_Mughal_empire.jpg'),
  ChatUser(
      uid: 'Cleopatra-VII',
      userName: 'クレオパトラ7世',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Kleopatra-VII.-Altes-Museum-Berlin1.jpg/220px-Kleopatra-VII.-Altes-Museum-Berlin1.jpg'),
  ChatUser(
      uid: 'Zhang-Fei',
      userName: '張飛',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/ZhangFei.jpg/180px-ZhangFei.jpg'),
  ChatUser(
      uid: 'Zhao-Yun',
      userName: '趙雲',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/ZhaoYun.jpg/200px-ZhaoYun.jpg'),
  ChatUser(
      uid: 'genso',
      userName: '玄宗',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Tang_XianZong.jpg/340px-Tang_XianZong.jpg'),
  ChatUser(
      uid: 'HanXin',
      userName: '韓信',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/H%C3%A1n_X%C3%ACn.jpg/200px-H%C3%A1n_X%C3%ACn.jpg'),
  ChatUser(
      uid: 'Kobu-tei',
      userName: '光武帝',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Han_Guangwu_Di.jpg/200px-Han_Guangwu_Di.jpg'),
  ChatUser(
      uid: 'kouu',
      userName: '項羽',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Xiang_Yu.jpg/220px-Xiang_Yu.jpg'),
  ChatUser(
      uid: 'Liu-hou',
      userName: '劉邦',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Hangaozu.jpg/170px-Hangaozu.jpg'),
  ChatUser(
      uid: 'dreary',
      userName: '蕭何',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Xiao_he.jpg/200px-Xiao_he.jpg'),
  ChatUser(
      uid: 'syokaturyo',
      userName: '諸葛亮',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/%E8%9C%80%E6%B1%89%E4%B8%9E%E7%9B%B8%E5%BF%A0%E6%AD%A6%E4%BE%AF%E8%AF%B8%E8%91%9B%E4%BA%AE.jpg/220px-%E8%9C%80%E6%B1%89%E4%B8%9E%E7%9B%B8%E5%BF%A0%E6%AD%A6%E4%BE%AF%E8%AF%B8%E8%91%9B%E4%BA%AE.jpg'),
  ChatUser(
      uid: 'Sokuten-bukou',
      userName: '則天武后',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/%E6%AD%A6%E5%88%99%E5%A4%A9%E7%94%BB%E5%83%8F.jpg/170px-%E6%AD%A6%E5%88%99%E5%A4%A9%E7%94%BB%E5%83%8F.jpg'),
  ChatUser(
      uid: "youte",
      userName: '煬帝',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Sui_Yangdi_Tang.jpg/170px-Sui_Yangdi_Tang.jpg'),
  ChatUser(
      uid: 'youkihi',
      userName: '楊貴妃',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/%E4%B8%8A%E9%A9%AC%E5%9B%BE.jpg/200px-%E4%B8%8A%E9%A9%AC%E5%9B%BE.jpg'),
  ChatUser(
      uid: 'hugi',
      userName: '溥儀',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Xuantong.jpg/300px-Xuantong.jpg'),
  ChatUser(
      uid: 'Otto-von-Bismarck',
      userName: 'オットー・フォン・ビスマルク',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Bundesarchiv_Bild_146-2005-0057%2C_Otto_von_Bismarck.jpg/400px-Bundesarchiv_Bild_146-2005-0057%2C_Otto_von_Bismarck.jpg'),
];
