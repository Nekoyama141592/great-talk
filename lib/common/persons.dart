import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

const String chatGPTId = "chatGPT";
const String wolframId = "wolfram";
// 現在のユーザーを定義.
const chatUiCurrrentUser = types.User(id: 'current_user');
final proIds = proPersons.map((e) => e.id).toList();
const proPersons = [
  types.User(
      id: chatGPTId,
      lastName: 'なんでもAI',
      imageUrl:
          'https://pbs.twimg.com/media/FqNXz8saAAEdaXz?format=jpg&name=medium'),
  types.User(
      id: wolframId,
      lastName: '数学の先生',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/29/14/49/cube-1780775__480.jpg'),
  types.User(
      id: 'human resources',
      lastName: '人事の専門家',
      metadata: {
        'description': '組織の人的資源を最大限に活用するための戦略を策定することを専門とする人',
      },
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/11/02/14/27/model-2911332__480.jpg'),
  types.User(
      id: 'chef',
      lastName: 'シェフ',
      metadata: {'description': '料理の専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1654922207993-2952fec328ae?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2hlZnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60'),
  types.User(
      id: 'patissier',
      lastName: 'パティシエ',
      metadata: {'description': 'お菓子の専門家'},
      imageUrl:
          "https://images.unsplash.com/photo-1519733870-f96bef9bc85f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8cGF0aXNzaWVyfGVufDB8fHx8MTY3OTQwMDk3MQ&ixlib=rb-4.0.3&q=80&w=400"),
  types.User(
      id: 'counselor',
      lastName: '心理カウンセラー',
      metadata: {'description': '心理的問題について相談に乗る専門家'},
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/03/26/21/54/yoga-2176668__480.jpg'),
  types.User(
      id: 'doctor',
      lastName: '医師',
      metadata: {'description': '病気の診断や治療を行う専門家'},
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/03/14/03/20/woman-2141808__480.jpg'),
  types.User(
      id: 'lawyer',
      lastName: '弁護士',
      metadata: {'description': '法律の専門家'},
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/04/12/16/33/hammer-719066__480.jpg'),
  types.User(
      id: 'teacher',
      lastName: '教師',
      metadata: {'description': '教育の専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1544717305-2782549b5136?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8dGVhY2hlcnxlbnwwfHx8fDE2NzkzMjMyNDY&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'economist',
      lastName: '経済学者',
      metadata: {'description': '経済の専門家'},
      imageUrl:
          'https://media.istockphoto.com/id/1311598658/ja/%E3%82%B9%E3%83%88%E3%83%83%E3%82%AF%E3%83%95%E3%82%A9%E3%83%88/%E3%83%86%E3%83%96%E3%83%AC%E3%83%83%E3%83%88%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E4%B8%8A%E3%81%AE%E3%83%93%E3%82%B8%E3%83%8D%E3%82%B9%E3%83%9E%E3%83%B3%E5%8F%96%E5%BC%95%E3%82%AA%E3%83%B3%E3%83%A9%E3%82%A4%E3%83%B3%E6%A0%AA%E5%BC%8F%E5%B8%82%E5%A0%B4%E3%83%87%E3%82%B8%E3%82%BF%E3%83%AB%E6%8A%95%E8%B3%87%E3%82%B3%E3%83%B3%E3%82%BB%E3%83%97%E3%83%88.jpg?s=612x612&w=0&k=20&c=kqXUEqaFyjbF5CxeOe8vq7mzP_DoY3McexsjUq60VbA='),
  types.User(
      id: 'engineer',
      lastName: '工学者',
      metadata: {'description': '技術の専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1581092163144-b7ae3c00adbc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8NXx8ZW5naW5lZXJ8ZW58MHx8fHwxNjc5MzUyNzk4&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'gardener',
      lastName: '園芸家',
      metadata: {'description': '植物の栽培や育成についての専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziARbQaUAARgsn?format=jpg&name=small'),
  types.User(
      id: 'architect',
      lastName: '建築家',
      metadata: {'description': '建築物の設計や監修をする専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziASQfaIAEIYkQ?format=jpg&name=small'),
  types.User(
      id: 'furnitureDesigner',
      lastName: '家具デザイナー',
      metadata: {'description': '家具のデザインに特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziATCzaMAEacn2?format=jpg&name=small'),
  types.User(
      id: 'filmDirector',
      lastName: '映画監督',
      metadata: {'description': '映画製作において指導・監督を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziAT-NaIAAARTe?format=jpg&name=small'),
  types.User(
      id: 'painter',
      lastName: '画家',
      metadata: {'description': '絵画を描く専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziBZLVaUAAwlMN?format=jpg&name=small'),
  types.User(
      id: 'interiorDesigner',
      lastName: 'インテリアデザイナー',
      metadata: {'description': '家具、カーテン、照明などのインテリアデザインに特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziBaJeaAAAketb?format=jpg&name=small'),
  types.User(
      id: 'fashionDesigner',
      lastName: 'ファッションデザイナー',
      metadata: {'description': '衣服やアクセサリーのデザインに特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziBbgCakAAhPGT?format=jpg&name=small'),
  types.User(
      id: 'photographer',
      lastName: '写真家',
      metadata: {'description': '写真を撮影する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziBdzBaQAAQmNO?format=jpg&name=small'),
  types.User(
      id: 'geologist',
      lastName: '地質学者',
      metadata: {'description': '地球の地質や地形を研究する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziCGhCaQAMw1WL?format=jpg&name=small'),
  types.User(
      id: 'linguist',
      lastName: '言語学者',
      metadata: {'description': '言語や言語現象を研究する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziCIMqaEAE8zF3?format=jpg&name=small'),
  types.User(
      id: 'statistician',
      lastName: '統計学者',
      metadata: {'description': 'データを分析して情報を得る専門家'},
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/08/18/13/26/interface-3614766__480.png'),
  types.User(
      id: 'game-designer',
      lastName: 'ゲームデザイナー',
      metadata: {'description': 'ビデオゲームの開発に特化した専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1542751371-adc38448a05e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8dmlkZW8lMjBnYW1lfGVufDB8fHx8MTY3OTQwMzQ0NQ&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'data-scientist',
      lastName: 'データサイエンティスト',
      metadata: {'description': '大量のデータを収集・分析して、ビジネスの意思決定をサポートする専門家'},
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/12/03/22/15/tablet-1075790_1280.jpg'),
  types.User(
      id: 'cartographer',
      lastName: '地図学者',
      metadata: {'description': '地図を作成し、地理情報の収集・管理に従事する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziCJqxaEAAfalH?format=jpg&name=small'),
  types.User(
      id: 'biologist',
      lastName: '生物学者',
      metadata: {'description': '生物についての研究を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziCLN0agAArXn7?format=jpg&name=small'),
  types.User(
      id: 'marketer',
      lastName: 'マーケター',
      metadata: {'description': '商品やサービスの販売促進に特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziC593agAEbVER?format=jpg&name=small'),
  types.User(
      id: 'entertainment-producer',
      lastName: '芸能プロデューサー',
      metadata: {'description': '芸能活動においてタレントのマネジメントやイベントの企画・運営に従事する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziC75magAE9lYC?format=jpg&name=small'),
  types.User(
      id: 'tv-director',
      lastName: 'テレビディレクター',
      metadata: {'description': 'テレビ番組の制作において指揮をとる専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziC_H9aAAAn6fK?format=jpg&name=small'),
  types.User(
      id: 'veterinarian',
      lastName: '獣医師',
      metadata: {'description': '動物の疾患の診断・治療を行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1628009368231-7bb7cfcb0def?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8Mnx8dmV0ZXJpbmFyaWFufGVufDB8fHx8MTY3OTM2ODcyOA&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'massage-therapist',
      lastName: 'マッサージ師',
      metadata: {'description': '身体のストレスや痛みの緩和を目的とした施術を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziDBfVaUAAW0bP?format=jpg&name=small'),
  types.User(
      id: 'researcher',
      lastName: '研究者',
      metadata: {'description': 'あるテーマについて研究を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziDeYaaQAMamTq?format=jpg&name=small'),
  types.User(
      id: 'sportsTrainer',
      lastName: 'スポーツトレーナー',
      metadata: {'description': 'スポーツ選手のコンディショニングやケガの予防・治療に従事する専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1604480133435-25b86862d276?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MjF8fHRyYWluZXJ8ZW58MHx8fHwxNjc5Mzk3MDE5&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'newsCaster',
      lastName: 'ニュースキャスター',
      metadata: {'description': 'ニュース番組の司会や報道に従事する専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1619743088831-4d2c38b40cce?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8bWlrZSUyMHBlcnNvbnxlbnwwfHx8fDE2Nzk0MDM4NTI&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'socialWorker',
      lastName: 'ソーシャルワーカー',
      metadata: {'description': '社会福祉や保健の問題に対して支援を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziDfkfaIAATDZE?format=jpg&name=small'),
  types.User(
      id: 'consultant',
      lastName: 'コンサルタント',
      metadata: {'description': '企業や組織の業務改善や問題解決のためのアドバイスを行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziDgdyaYAAlnac?format=jpg&name=small'),
  types.User(
      id: 'nurse',
      lastName: '看護師',
      metadata: {'description': '病院やクリニックで患者さんの健康管理や医療に関わる専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1584432810601-6c7f27d2362b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8bnVyc2V8ZW58MHx8fHwxNjc5Mzk5MDI0&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'sociologist',
      lastName: '社会学者',
      metadata: {'description': '社会の構造や社会問題を研究する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziDiMfaMAIFMpK?format=jpg&name=small'),
  types.User(
      id: 'illustrator',
      lastName: 'イラストレーター',
      metadata: {'description': '絵を描くことに特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziEILGaAAUCtws?format=jpg&name=small'),
  types.User(
      id: 'soundEngineer',
      lastName: 'サウンドエンジニア',
      metadata: {'description': '音響の専門家で、音楽や映画、テレビなどの音響を制作する専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1520872024865-3ff2805d8bb3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTh8fHNpbmd8ZW58MHx8fHwxNjc5MzgyOTc5&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'seismologist',
      lastName: '地震学者',
      metadata: {'description': '地震や地殻変動を研究する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziEJWUaIAE1ypl?format=jpg&name=small'),
  types.User(
      id: 'foodsanitation',
      lastName: '食品衛生士',
      metadata: {'description': '食品の衛生管理に特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziEKTZakAEOvOz?format=jpg&name=small'),
  types.User(
      id: 'webdesigner',
      lastName: 'ウェブデザイナー',
      metadata: {'description': 'ウェブサイトのデザインに特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziEL96aMAESS47?format=jpg&name=small'),
  types.User(
      id: 'environmentalist',
      lastName: '環境保護活動家',
      metadata: {'description': '環境問題に関する啓発活動や対策の提言を行う専門家'},
      imageUrl:
          'https://cdn.pixabay.com/photo/2023/02/14/04/39/volunteer-7788809_1280.jpg'),
  types.User(
      id: 'copywriter',
      lastName: 'コピーライター',
      metadata: {'description': '広告や宣伝のためのキャッチコピーを考える専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziE1QcaUAAKMsQ?format=jpg&name=small'),
  types.User(
      id: 'manager',
      lastName: 'マネージャー',
      metadata: {'description': 'アーティストやスポーツ選手、企業などのマネジメントを行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziE23XaUAIwcjP?format=jpg&name=360x360'),
  types.User(
      id: 'educationalist',
      lastName: '教育学者',
      metadata: {'description': '教育に関する研究や分析を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziE4BZakAEek-e?format=jpg&name=small'),
  types.User(
      id: 'foodStylist',
      lastName: 'フードスタイリスト',
      metadata: {'description': '料理や食材のスタイリングに特化した専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1526683224143-73288bb6996e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTd8fGVhdHxlbnwwfHx8fDE2Nzk0MDQ1MzE&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'fitnessInstructor',
      lastName: 'フィットネスインストラクター',
      metadata: {'description': '健康やフィットネスに関する指導を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziE5FxaMAAcHHv?format=jpg&name=small'),
  types.User(
      id: 'civilEngineer',
      lastName: '土木技術者',
      metadata: {'description': '道路や橋などの土木工事に関する技術的なアドバイスを行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziF7B8aUAAh4KK?format=jpg&name=small'),
  types.User(
      id: 'technicalWriter',
      lastName: 'テクニカルライター',
      metadata: {'description': '科学技術や医学などの専門的な知識を持ったライター'},
      imageUrl:
          'https://pbs.twimg.com/media/FziF8d_agAAiQGv?format=jpg&name=small'),
  types.User(
      id: 'freelanceWriter',
      lastName: 'ジャーナリスト',
      metadata: {'description': '作家やジャーナリストなど、フリーランスで執筆活動を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziF-UIaYAIhzfC?format=jpg&name=small'),
  types.User(
      id: 'itConsultant',
      lastName: 'ITコンサルタント',
      metadata: {'description': 'コンピューターシステムやソフトウェアのアドバイスを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1583508915901-b5f84c1dcde1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTh8fGZyZWVsYW5jZXxlbnwwfHx8fDE2NzkzMjI1ODU&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'gemologist',
      lastName: '宝石鑑定士',
      metadata: {'description': '宝石の鑑定に特化した専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1610575528294-97e56df074f9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8Z2VtJTIwcGVyc29ufGVufDB8fHx8MTY3OTQwNDcwMA&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'financialPlanner',
      lastName: 'ファイナンシャルプランナー',
      metadata: {'description': '資産運用やライフプランに関するアドバイスを行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziF_kcakAEmvuZ?format=jpg&name=small'),
  types.User(
      id: 'aromatherapist',
      lastName: 'アロマセラピスト',
      metadata: {'description': 'アロマオイルを使用したセラピーを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1515377905703-c4788e51af15?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8YXJvbWF8ZW58MHx8fHwxNjc5MzU3MjQ1&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'stylist',
      lastName: 'スタイリスト',
      metadata: {'description': '衣服やメイクアップのスタイリングに特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziGejJaQAAPKip?format=jpg&name=small'),
  types.User(
      id: 'homeStager',
      lastName: 'ホームステージャー',
      metadata: {'description': '不動産物件の内装装飾やレイアウトのアドバイスを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1523217582562-09d0def993a6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTZ8fGhvbWV8ZW58MHx8fHwxNjc5NDA0ODE2&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'graphicDesigner',
      lastName: 'グラフィックデザイナー',
      metadata: {'description': '広告やポスター、パンフレットなどのデザインに特化した専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1622119029245-5bf43951115a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8N3x8dWl8ZW58MHx8fHwxNjc5NDA0ODU5&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'pharmacist',
      lastName: '薬剤師',
      metadata: {'description': '薬剤や薬の効果・副作用に関する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziGgGWagAEygJm?format=jpg&name=small'),
  types.User(
      id: 'sportsTrainer',
      lastName: 'スポーツトレーナー',
      metadata: {'description': 'スポーツ選手やアスリートの身体管理やトレーニング指導を行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1517438984742-1262db08379e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTd8fHRyYWluZXJ8ZW58MHx8fHwxNjc5Mzk3MDE5&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'housekeeper',
      lastName: 'ハウスキーパー',
      metadata: {'description': '家事代行や掃除、洗濯、料理などの家庭サービスを提供する専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1578593195423-df7df9563457?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8aG91c2VrZWVwZXJ8ZW58MHx8fHwxNjc5NDA0OTQ0&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'prosecutor',
      lastName: '検察官',
      metadata: {'description': '刑事司法の専門家で、犯罪の捜査や訴追を行う'},
      imageUrl:
          'https://images.unsplash.com/photo-1649653084130-06638e40ca25?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8NHx8cHJvc2VjdXRvcnxlbnwwfHx8fDE2Nzk0MDQ5Nzc&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'radioDJ',
      lastName: 'ラジオDJ',
      metadata: {'description': 'ラジオ番組のパーソナリティとして、音楽やトークを担当する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziGhc-aMAISHzt?format=jpg&name=small'),
  types.User(
      id: 'projectManager',
      lastName: 'プロジェクトマネージャー',
      metadata: {'description': 'プロジェクトの計画や進行管理、チームのコーディネートを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1531403009284-440f080d1e12?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8cHJvamVjdCUyMG1hbmFnZXJ8ZW58MHx8fHwxNjc5NDA1MDYw&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'speechTherapist',
      lastName: 'スピーチセラピスト',
      metadata: {'description': '言語障害のある人のために、コミュニケーションスキルを向上させるセラピーを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1576778453123-ab240b89dd52?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MjJ8fHNwZWVjaHxlbnwwfHx8fDE2NzkzNDk1MTE&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'managementConsultant',
      lastName: '経営コンサルタント',
      metadata: {'description': '経営戦略やマーケティング戦略に関するアドバイスを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1600880292203-757bb62b4baf?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8OHx8Y29uc3VsdGFudHxlbnwwfHx8fDE2NzkzNzc1ODY&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'artDirector',
      lastName: 'アートディレクター',
      metadata: {'description': '広告や映像作品、出版物などのアートディレクションを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1598387746216-506f6bd47aad?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8YXJ0JTIwZGlyZWN0b3J8ZW58MHx8fHwxNjc5NDA1MjY5&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'hotelManager',
      lastName: 'ホテルマネージャー',
      metadata: {'description': 'ホテル運営に関する全般的なマネジメントを行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziGkveaEAAGHIy?format=jpg&name=small'),
  types.User(
      id: 'personalTrainer',
      lastName: 'パーソナルトレーナー',
      metadata: {'description': '個人的なフィットネスプランの作成やトレーニング指導を行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1519311965067-36d3e5f33d39?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8cGVyc29uYWwlMjB0cmFpbmVyfGVufDB8fHx8MTY3OTQwNTM0MQ&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'translator',
      lastName: '翻訳家',
      metadata: {'description': '外国語の翻訳に特化した専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1575707751065-42256084fbb7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8OXx8c3BlZWNofGVufDB8fHx8MTY3OTM0OTUxMQ&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'audioEngineer',
      lastName: '音響エンジニア',
      metadata: {'description': '音楽や映画、テレビ番組などの音響に特化した専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziHTC8aEAA5y1t?format=jpg&name=small'),
  types.User(
      id: 'producer',
      lastName: 'プロデューサー',
      metadata: {'description': 'テレビ番組、映画、音楽などの制作に関わる専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1516223725307-6f76b9ec8742?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8Nnx8cHJvZHVjZXJ8ZW58MHx8fHwxNjc5NDAzNTQ5&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'marketingSpecialist',
      lastName: 'マーケティング担当者',
      metadata: {'description': '製品やサービスの販売戦略を立案し、マーケティング活動を行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1670272505497-d532f0b50702?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDF8MXxzZWFyY2h8MXx8b2ZmaWNlfGVufDB8fHx8MTY3OTM1ODI2OQ&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'mentalHealthCounselor',
      lastName: 'メンタルヘルスカウンセラー',
      metadata: {'description': '心理学やカウンセリングの知識を持ち、メンタルヘルスに関する相談やアドバイスを行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziHUbzaMAEJocZ?format=jpg&name=small'),
  types.User(
      id: 'animator',
      lastName: 'アニメーター',
      metadata: {'description': 'アニメーション映画やテレビ番組の制作に携わる専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziHWC8aQAAcpuO?format=jpg&name=small'),
  types.User(
      id: 'businessConsultant',
      lastName: 'ビジネスコンサルタント',
      metadata: {'description': '企業や組織の経営や業務改善に関するアドバイスを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1664575599730-0814817939de?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8N3x8YnVzaW5lc3N8ZW58MHx8fHwxNjc5MzYyNTEx&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'policeOfficer',
      lastName: '警察官',
      metadata: {'description': '治安維持や交通規制、犯罪の捜査や防止などを行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziHW6DacAIh63y?format=jpg&name=small'),
  types.User(
      id: 'photographer',
      lastName: 'フォトグラファー',
      metadata: {'description': '写真撮影に特化した専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1625492922105-5914617fd869?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTh8fHBob3RvZ3JhcGhlcnxlbnwwfHx8fDE2Nzk0MDU4OTk&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'organizer',
      lastName: 'オーガナイザー',
      metadata: {'description': '収納や片付けのアドバイスを行う専門家'},
      imageUrl:
          'https://images.unsplash.com/photo-1577415124269-fc1140a69e91?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8NTJ8fGJ1c2luZXNzfGVufDB8fHx8MTY3OTM2MjUxMg&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'restaurantOwner',
      lastName: 'レストランオーナー',
      metadata: {'description': '飲食店の経営を行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziH0lJaUAANQ9S?format=jpg&name=small'),
  types.User(
      id: 'securityConsultant',
      lastName: 'セキュリティコンサルタント',
      metadata: {'description': '防犯対策や情報セキュリティに関するアドバイスを行う専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziH1l2aIAUYUrK?format=jpg&name=small'),
  types.User(
      id: 'programmer',
      lastName: 'プログラマー',
      metadata: {'description': 'コンピュータプログラムの開発や保守に関する専門家'},
      imageUrl:
          'https://pbs.twimg.com/media/FziH3ktagAIaL9f?format=jpg&name=small'),
  types.User(
      id: 'aircraftPilot',
      lastName: '航空機パイロット',
      metadata: {
        'description': '航空機の操縦や運航に関する専門家',
      },
      imageUrl:
          'https://pbs.twimg.com/media/FziH5NDaYAQFy97?format=jpg&name=small'),
  types.User(
      id: 'logoDesigner',
      lastName: 'ロゴデザイナー',
      metadata: {
        'description': 'ロゴやブランディングに関するデザインに特化した専門家',
      },
      imageUrl:
          'https://images.unsplash.com/photo-1612831660846-778e3a5548bd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MTZ8fGRlc2lnbmVyfGVufDB8fHx8MTY3OTQwNjIyMQ&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'speechTrainer',
      lastName: 'スピーチトレーナー',
      metadata: {
        'description': 'スピーチやプレゼンテーションの指導に特化した専門家',
      },
      imageUrl:
          'https://images.unsplash.com/photo-1564522365984-c08ed1f78893?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8M3x8c3BlZWNofGVufDB8fHx8MTY3OTM0OTUxMQ&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'writer',
      lastName: 'ライター',
      metadata: {
        'description': '文章の執筆や編集に特化した専門家',
      },
      imageUrl:
          'https://pbs.twimg.com/media/FziIQbvakAYjf_-?format=jpg&name=small'),
  types.User(
      id: 'securitiesAnalyst',
      lastName: '証券アナリスト',
      metadata: {
        'description': '株式や債券などの投資商品の分析や予測に関する専門家',
      },
      imageUrl:
          'https://pbs.twimg.com/media/FziIScWaAAAngrt?format=jpg&name=small'),
  types.User(
      id: 'webMarketer',
      lastName: 'ウェブマーケター',
      metadata: {
        'description': 'ウェブサイトやソーシャルメディアを活用したマーケティングに関する専門家',
      },
      imageUrl:
          'https://images.unsplash.com/photo-1557804506-669a67965ba0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNTgwfDB8MXxzZWFyY2h8MXx8d2ViJTIwbWFya2V0ZXJ8ZW58MHx8fHwxNjc5NDA2NDU1&ixlib=rb-4.0.3&q=80&w=400'),
  types.User(
      id: 'beautician',
      lastName: '美容師',
      metadata: {
        'description': '髪型やメイクなどの美容に特化した専門家',
      },
      imageUrl:
          'https://pbs.twimg.com/media/FziITdwaEDML9jT?format=jpg&name=small'),
  types.User(
      id: 'robot designer',
      lastName: 'ロボットデザイナー',
      metadata: {
        'description': '色彩を利用して心理的な問題を解決する専門職',
      },
      imageUrl:
          'https://pbs.twimg.com/media/FziIU20aQAEziVA?format=jpg&name=small'),
];
const fullPersons = [
  types.User(
      id: 'Albert Einstein.',
      lastName: 'アルベルト・アインシュタイン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Einstein1921_by_F_Schmutzer_2.jpg/225px-Einstein1921_by_F_Schmutzer_2.jpg'),
  types.User(
      id: 'Isaac Newton',
      lastName: 'アイザック・ニュートン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/GodfreyKneller-IsaacNewton-1689.jpg/225px-GodfreyKneller-IsaacNewton-1689.jpg'),
  types.User(
      id: 'Charles Darwin',
      lastName: 'チャールズ・ダーウィン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Hw-darwin.jpg/225px-Hw-darwin.jpg'),
  types.User(
      id: 'Galileo Galilei',
      lastName: 'ガリレオ・ガリレイ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Galileo-sustermans2.jpg/225px-Galileo-sustermans2.jpg'),
  types.User(
      id: 'Leonardo da Vinci',
      lastName: 'レオナルド・ダ・ヴィンチ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Leonardo_da_Vinci_-_presumed_self-portrait_-_WGA12798.jpg/220px-Leonardo_da_Vinci_-_presumed_self-portrait_-_WGA12798.jpg'),
  types.User(
      id: 'Pythagoras',
      lastName: 'ピタゴラス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Kapitolinischer_Pythagoras_adjusted.jpg/200px-Kapitolinischer_Pythagoras_adjusted.jpg'),
  types.User(
      id: 'Carl Friedrich Gauss',
      lastName: 'カール・フリードリヒ・ガウス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Carl_Friedrich_Gauss.jpg/225px-Carl_Friedrich_Gauss.jpg'),
  types.User(
      id: 'Nikola Tesla',
      lastName: 'ニコラ・テスラ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Tesla_Sarony.jpg/225px-Tesla_Sarony.jpg'),
  types.User(
      id: 'Michael Faraday',
      lastName: 'マイケル・ファラデー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Michael_Faraday_001.jpg/200px-Michael_Faraday_001.jpg'),
  types.User(
      id: 'Srinivasa Ramanujan',
      lastName: 'シュリニヴァーサ・ラマヌジャン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Srinivasa_Ramanujan_-_OPC_-_1.jpg/450px-Srinivasa_Ramanujan_-_OPC_-_1.jpg'),
  types.User(
      id: "Yosano Akiko",
      lastName: "与謝野晶子",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/7/72/Akiko_Yosano_younger.jpg"),
  types.User(
      id: 'Jean-Henri Fabre.',
      lastName: 'ジャン・アンリ・ファーブル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Jean-henri_fabre.jpg/225px-Jean-henri_fabre.jpg'),
  types.User(
      id: 'Louis Pasteur',
      lastName: 'ルイ・パスツール',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Louis_Pasteur.jpg/225px-Louis_Pasteur.jpg'),
  types.User(
      id: 'Ukichiro Nakatani',
      lastName: '中谷宇吉郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Nakaya_Ukichiro_in_1946.jpg/250px-Nakaya_Ukichiro_in_1946.jpg'),
  types.User(
      id: 'Shibasaburo Kitasato',
      lastName: '北里柴三郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Kitasato_Shibasaburo.jpg/250px-Kitasato_Shibasaburo.jpg'),
  types.User(
      id: 'Antoine Lavoisier',
      lastName: 'アントワーヌ・ラヴォアジエ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/David_-_Portrait_of_Monsieur_Lavoisier_%28cropped%29.jpg/225px-David_-_Portrait_of_Monsieur_Lavoisier_%28cropped%29.jpg'),
  types.User(
      id: 'the Wright brothers',
      lastName: 'ライト兄弟',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Wilbur_Wright.jpg/150px-Wilbur_Wright.jpg'),
  types.User(
      id: 'Marie Curie.',
      lastName: 'マリ・キュリー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Marie_Curie_1903.jpg/225px-Marie_Curie_1903.jpg'),
  types.User(
      id: 'Alfred Wegener',
      lastName: 'アルフレート・ヴェーゲナー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Alfred_Wegener_ca.1924-30.jpg/250px-Alfred_Wegener_ca.1924-30.jpg'),
  types.User(
      id: 'Ino Tadataka',
      lastName: '伊能忠敬',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Ino-tadataka%2Csawara%2Ckatori-city%2Cjapan.JPG/200px-Ino-tadataka%2Csawara%2Ckatori-city%2Cjapan.JPG'),
  types.User(
      id: 'James Watt',
      lastName: 'ジェームズ・ワット',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Watt_James_von_Breda.jpg/250px-Watt_James_von_Breda.jpg'),
  types.User(
      id: 'Dmitri Mendeleyev',
      lastName: 'ドミトリ・メンデレーエフ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/DIMendeleevCab.jpg/225px-DIMendeleevCab.jpg'),
  types.User(
      id: 'Tomitaro Makino',
      lastName: '牧野富太郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Makino_Tomitaro.jpg/200px-Makino_Tomitaro.jpg'),
  types.User(
      id: 'Gregor Johan Mendel.',
      lastName: 'グレゴール・ヨハン・メンデル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Gregor_Mendel.png/225px-Gregor_Mendel.png'),
  types.User(
      id: 'Fritjof Nansen.',
      lastName: 'フリチョフ・ナンセン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Bundesarchiv_Bild_102-09772%2C_Fridjof_Nansen.jpg/200px-Bundesarchiv_Bild_102-09772%2C_Fridjof_Nansen.jpg'),
  types.User(
      id: 'Sugita Genpaku era (1644.2.15-1648.2.15)',
      lastName: '杉田玄白',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Sugita_Genpaku.jpg/220px-Sugita_Genpaku.jpg'),
  types.User(
      id: 'Jean-François Champollion',
      lastName: 'ジャン＝フランソワ・シャンポリオン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Jean-Francois_Champollion_2.jpg/250px-Jean-Francois_Champollion_2.jpg'),
  types.User(
      id: 'Nagaoka Hantaro',
      lastName: '長岡半太郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Hantaro_Nagaoka.jpg/225px-Hantaro_Nagaoka.jpg'),
  types.User(
      id: 'James Clark Maxwell.',
      lastName: 'ジェームズ・クラーク・マクスウェル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/James_Clerk_Maxwell.png/225px-James_Clerk_Maxwell.png'),
  types.User(
      id: 'Kotaro Honda',
      lastName: '本多光太郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Kotaro_Honda.jpg/200px-Kotaro_Honda.jpg'),
  types.User(
      id: 'Paul Ehrlich',
      lastName: 'パウル・エールリヒ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Paul_Ehrlich_1915.jpg/200px-Paul_Ehrlich_1915.jpg'),
  types.User(
      id: 'Niels Bohr.',
      lastName: 'ニールス・ボーア',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Niels_Bohr.jpg/225px-Niels_Bohr.jpg'),
  types.User(
      id: 'Archimedes',
      lastName: 'アルキメデス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Retrato_de_un_erudito_%28%C2%BFArqu%C3%ADmedes%3F%29%2C_por_Domenico_Fetti.jpg/225px-Retrato_de_un_erudito_%28%C2%BFArqu%C3%ADmedes%3F%29%2C_por_Domenico_Fetti.jpg'),
  types.User(
      id: 'John Dalton',
      lastName: 'ジョン・ドルトン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Dalton_John_desk.jpg/240px-Dalton_John_desk.jpg'),
  types.User(
      id: 'William Ramsey',
      lastName: 'ウィリアム・ラムゼー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/William_Ramsay.jpg/180px-William_Ramsay.jpg'),
  types.User(
      id: 'Hideki Yukawa',
      lastName: '湯川秀樹',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Yukawa.jpg/225px-Yukawa.jpg'),
  types.User(
      id: 'Konstantin Tsiolkovsky.',
      lastName: 'コンスタンチン・ツィオルコフスキー',
      imageUrl: 'https://weblio.hs.llnwd.net/e7/img/dict/spchk/207.jpg'),
  types.User(
      id: 'Justus von Liebig',
      lastName: 'ユストゥス・フォン・リービッヒ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/b/b2/Justus_von_Liebig.jpg'),
  types.User(
      id: 'Antoni van Leeuwenhoek.',
      lastName: 'アントニ・ファン・レーウェンフック',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Jan_Verkolje_-_Antonie_van_Leeuwenhoek.jpg/225px-Jan_Verkolje_-_Antonie_van_Leeuwenhoek.jpg'),
  types.User(
      id: 'Hiraga Gennai',
      lastName: '平賀源内',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/A_Portrait_of_Ky%C5%ABkei_Hiraga_cropped.jpg/250px-A_Portrait_of_Ky%C5%ABkei_Hiraga_cropped.jpg'),
  types.User(
      id: 'Alexander Graham Bell.',
      lastName: 'アレクサンダー・グラハム・ベル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Alexander_Graham_Bell.jpg/225px-Alexander_Graham_Bell.jpg'),
  types.User(
      id: 'Ernest Rutherford.',
      lastName: 'アーネスト・ラザフォード',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Ernest_Rutherford_LOC.jpg/250px-Ernest_Rutherford_LOC.jpg'),
  types.User(
      id: 'Alexander Fleming.',
      lastName: 'アレクサンダー・フレミング',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Synthetic_Production_of_Penicillin_TR1468.jpg/200px-Synthetic_Production_of_Penicillin_TR1468.jpg'),
  types.User(
      id: 'Guglielmo Marconi',
      lastName: 'グリエルモ・マルコーニ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Guglielmo_Marconi.jpg/225px-Guglielmo_Marconi.jpg'),
  types.User(
      id: 'James Hutton',
      lastName: 'ジェームズ・ハットン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Hutton_James_portrait_Raeburn.jpg/225px-Hutton_James_portrait_Raeburn.jpg'),
  types.User(
      id: 'Max Delbrück.',
      lastName: 'マックス・デルブリュック',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Maxdelbr%C3%BCck.jpg/225px-Maxdelbr%C3%BCck.jpg'),
  types.User(
      id: 'Walt Disney',
      lastName: 'ウォルト・ディズニー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Walt_disney_portrait.jpg/250px-Walt_disney_portrait.jpg'),
  types.User(
      id: 'Edmund Halley',
      lastName: 'エドモンド・ハレー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Edmund_Halley.gif/225px-Edmund_Halley.gif'),
  types.User(
      id: 'Georges Cuvier',
      lastName: 'ジョルジュ・キュヴィエ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Bolton-cuvier.jpg/225px-Bolton-cuvier.jpg'),
  types.User(
      id: 'Aristotle.',
      lastName: 'アリストテレス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Aristotle_Altemps_Inv8575.jpg/200px-Aristotle_Altemps_Inv8575.jpg'),
  types.User(
      id: 'Roar Amundsen.',
      lastName: 'ロアール・アムンセン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Nlc_amundsen.jpg/200px-Nlc_amundsen.jpg'),
  types.User(
      id: 'Heinrich Schliemann.',
      lastName: 'ハインリヒ・シュリーマン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Heinrich_Schliemann.jpg/220px-Heinrich_Schliemann.jpg'),
  types.User(
      id: 'Takakazu Seki',
      lastName: '関孝和',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Seki.jpeg/220px-Seki.jpeg'),
  types.User(
      id: 'Max Planck.',
      lastName: 'マックス・プランク',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Max_Planck_1933.jpg/225px-Max_Planck_1933.jpg'),
  types.User(
      id: 'Howard Carter',
      lastName: 'ハワード・カーター',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Howard_carter.jpg/173px-Howard_carter.jpg'),
  types.User(
      id: 'Roberto Bunsen',
      lastName: 'ロベルト・ブンゼン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Robert_Bunsen_02.jpg/200px-Robert_Bunsen_02.jpg'),
  types.User(
      id: 'Niels Abel.',
      lastName: 'ニールス・アーベル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Niels_Henrik_Abel.jpg/180px-Niels_Henrik_Abel.jpg'),
  types.User(
      id: 'Auguste Picard',
      lastName: 'オーギュスト・ピカール',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Bundesarchiv_Bild_102-13738%2C_Auguste_Piccard.jpg/220px-Bundesarchiv_Bild_102-13738%2C_Auguste_Piccard.jpg'),
  types.User(
      id: 'Christopher Columbus',
      lastName: 'クリストファー・コロンブス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Ridolfo_Ghirlandaio_Columbus.jpg/200px-Ridolfo_Ghirlandaio_Columbus.jpg'),
  types.User(
      id: 'George Stevenson.',
      lastName: 'ジョージ・スチーブンソン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/GeorgeStephenson.PNG/220px-GeorgeStephenson.PNG'),
  types.User(
      id: 'Umetaro Suzuki',
      lastName: '鈴木梅太郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/1/15/Suzukiumetaro.jpg'),
  types.User(
      id: 'Charles Lindbergh',
      lastName: 'チャールズ・リンドバーグ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Col_Charles_Lindbergh.jpg/200px-Col_Charles_Lindbergh.jpg'),
  types.User(
      id: 'Johannes Kepler',
      lastName: 'ヨハネス・ケプラー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Kepler.png/225px-Kepler.png'),
  types.User(
      id: 'Ferdinand Magellan',
      lastName: 'フェルディナンド・マゼラン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Ferdinand_Magellan.jpg/180px-Ferdinand_Magellan.jpg'),
  types.User(
      id: 'Fusayoshi Omori',
      lastName: '大森房吉',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Omori_Fusakichi.jpg/225px-Omori_Fusakichi.jpg'),
  types.User(
      id: 'Robert Boyle',
      lastName: 'ロバート・ボイル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Robert_Boyle_0001.jpg/250px-Robert_Boyle_0001.jpg'),
  types.User(
      id: 'Sven Hedin.',
      lastName: 'スヴェン・ヘディン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Sven_Hedin_01.jpg/250px-Sven_Hedin_01.jpg'),
  types.User(
      id: 'Heike Kammerling Onnes.',
      lastName: 'ヘイケ・カメルリング・オネス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Kamerlingh_portret.jpg/200px-Kamerlingh_portret.jpg'),
  types.User(
      id: 'Johannes Gutenberg.',
      lastName: 'ヨハネス・グーテンベルク',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Gutenberg.jpg/220px-Gutenberg.jpg'),
  types.User(
      id: 'Masatoshi Okochi',
      lastName: '大河内正敏',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Masatoshi_Okochi.JPG/200px-Masatoshi_Okochi.JPG'),
  types.User(
      id: 'Erwin Schrodinger.',
      lastName: 'エルヴィン・シュレーディンガー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Erwin_Schr%C3%B6dinger_%281933%29.jpg/225px-Erwin_Schr%C3%B6dinger_%281933%29.jpg'),
  types.User(
      id: 'Blaise Pascal',
      lastName: 'ブレーズ・パスカル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Blaise_pascal.jpg/200px-Blaise_pascal.jpg'),
  types.User(
      id: 'Wendell Stanley.',
      lastName: 'ウェンデル・スタンリー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Wendell_Meredith_Stanley.jpg/200px-Wendell_Meredith_Stanley.jpg'),
  types.User(
      id: 'Robert Peary.',
      lastName: 'ロバート・ピアリー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/RobertPeary.jpg/200px-RobertPeary.jpg'),
  types.User(
      id: 'Werner Heisenberg',
      lastName: 'ヴェルナー・ハイゼンベルク',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Bundesarchiv_Bild183-R57262%2C_Werner_Heisenberg.jpg/225px-Bundesarchiv_Bild183-R57262%2C_Werner_Heisenberg.jpg'),
  types.User(
      id: 'Amedeo Avogadro.',
      lastName: 'アメデオ・アヴォガドロ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Amadeo_Avogadro.png/225px-Amadeo_Avogadro.png'),
  types.User(
      id: 'Karl Benz',
      lastName: 'カール・ベンツ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Karl_Benz.jpg/220px-Karl_Benz.jpg'),
  types.User(
      id: 'Edward Jenner.',
      lastName: 'エドワード・ジェンナー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Edward_Jenner.jpg/225px-Edward_Jenner.jpg'),
  types.User(
      id: 'Alessandro Volta',
      lastName: 'アレッサンドロ・ボルタ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Alessandro_Volta.jpeg/225px-Alessandro_Volta.jpeg'),
  types.User(
      id: 'Hata Sahachiro',
      lastName: '秦佐八郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Sahachiro_Hata.jpg/180px-Sahachiro_Hata.jpg'),
  types.User(
      id: 'Philipp Franz von Siebold',
      lastName: 'フィリップ・フランツ・フォン・シーボルト',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/%E3%82%B7%E3%83%BC%E3%83%9C%E3%83%AB%E3%83%88_%E5%B7%9D%E5%8E%9F%E6%85%B6%E8%B3%80%E7%AD%86.jpg/250px-%E3%82%B7%E3%83%BC%E3%83%9C%E3%83%AB%E3%83%88_%E5%B7%9D%E5%8E%9F%E6%85%B6%E8%B3%80%E7%AD%86.jpg'),
  types.User(
      id: 'John von Neumann',
      lastName: 'ジョン・フォン・ノイマン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/JohnvonNeumann-LosAlamos.gif/225px-JohnvonNeumann-LosAlamos.gif'),
  types.User(
      id: 'Robert Fulton',
      lastName: 'ロバート・フルトン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Fulton.jpg/200px-Fulton.jpg'),
  types.User(
      id: 'Edmund Hillary',
      lastName: 'エドモンド・ヒラリー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Edmundhillarycropped.jpg/200px-Edmundhillarycropped.jpg'),
  types.User(
      id: 'Hugo de Vries',
      lastName: 'ユーゴー・ド・フリース',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Hugo_de_Vries_2.jpg/200px-Hugo_de_Vries_2.jpg'),
  types.User(
      id: 'Wallace Carothers.',
      lastName: 'ウォーレス・カロザース',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Wallace_Carothers%2C_in_the_lab.jpg/225px-Wallace_Carothers%2C_in_the_lab.jpg'),
  types.User(
      id: 'Thomas Edison.',
      lastName: 'トーマス・エジソン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Thomas_Edison2.jpg/250px-Thomas_Edison2.jpg'),
  types.User(
      id: 'Carl von Rinne',
      lastName: 'カール・フォン・リンネ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Carl_von_Linn%C3%A9.jpg/180px-Carl_von_Linn%C3%A9.jpg'),
  types.User(
      id: 'Henry Cavendish',
      lastName: 'ヘンリー・キャヴェンディッシュ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Cavendish_Henry_signature.jpg/225px-Cavendish_Henry_signature.jpg'),
  types.User(
      id: 'Louis Jacques Mande Daguerre',
      lastName: 'ルイ・ジャック・マンデ・ダゲール',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Louis_Daguerre.jpg/220px-Louis_Daguerre.jpg'),
  types.User(
      id: 'Robert Koch',
      lastName: 'ローベルト・コッホ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Robert_Koch.jpg/225px-Robert_Koch.jpg'),
  types.User(
      id: 'Nicolaus Copernicus',
      lastName: 'ニコラウス・コペルニクス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Nikolaus_Kopernikus.jpg/225px-Nikolaus_Kopernikus.jpg'),
  types.User(
      id: 'Alfred Nobel',
      lastName: 'アルフレッド・ノーベル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/AlfredNobel2.jpg/200px-AlfredNobel2.jpg'),
  types.User(
      id: 'Albert Michelson',
      lastName: 'アルバート・マイケルソン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Albert_Abraham_Michelson2.jpg/225px-Albert_Abraham_Michelson2.jpg'),
  types.User(
      id: 'George Gamow.',
      lastName: 'ジョージ・ガモフ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/1/1d/Bragg_lab1_1930_%28cropped%29.jpg'),
  types.User(
      id: 'Alexander von Humboldt',
      lastName: 'アレクサンダー・フォン・フンボルト',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/AvHumboldt.jpg/225px-AvHumboldt.jpg'),
  types.User(
      id: 'René Descartes',
      lastName: 'ルネ・デカルト',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Frans_Hals_-_Portret_van_Ren%C3%A9_Descartes.jpg/200px-Frans_Hals_-_Portret_van_Ren%C3%A9_Descartes.jpg'),
  types.User(
      id: 'James Prescott Jules',
      lastName: 'ジェームズ・プレスコット・ジュール',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Joule_James_sitting.jpg/250px-Joule_James_sitting.jpg'),
  types.User(
      id: 'Himiko (Japanese goddess of war)',
      lastName: '卑弥呼',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Queen-Himiko-Museum-Yayoi-Culture.png/200px-Queen-Himiko-Museum-Yayoi-Culture.png'),
  types.User(
      id: 'Yamato Takel (god of war)',
      lastName: 'ヤマトタケル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Yamato_Takeru%28bronze_statue%2COsaka%2901.jpg/250px-Yamato_Takeru%28bronze_statue%2COsaka%2901.jpg'),
  types.User(
      id:
          'Ninoku no Tenno (the eight hereditary titles; one of the three Imperial regents and four highest-ranking noblemen)',
      lastName: '仁徳天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Nintoku-tenn%C5%8D_detail.jpg/190px-Nintoku-tenn%C5%8D_detail.jpg'),
  types.User(
      id: 'lesser cuckoo (Cuculus poliocephalus)',
      lastName: '蘇我馬子',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Soga_no_Umako.jpg/240px-Soga_no_Umako.jpg'),
  types.User(
      id: 'Prince Shotoku Taishi',
      lastName: '聖徳太子',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Umayado_Miko.jpg/220px-Umayado_Miko.jpg'),
  types.User(
      id: 'Ono no Imoko (fourth highest of the eight hereditary titles)',
      lastName: '小野妹子',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Grave_of_Onono_Imoko1.jpg/220px-Grave_of_Onono_Imoko1.jpg'),
  types.User(
      id:
          'Suoga Iruka (member of a pre-WWII body that informally advised the emperor)',
      lastName: '蘇我入鹿',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Kamatari_and_Prince_Oe_Killing_the_Usurper_Iruka_LACMA_M.84.31.251.jpg/200px-Kamatari_and_Prince_Oe_Killing_the_Usurper_Iruka_LACMA_M.84.31.251.jpg'),
  types.User(
      id: 'middle-sized and high-ranking Imperial prince',
      lastName: '中大兄皇子',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Emperor_Tenji.jpg/250px-Emperor_Tenji.jpg'),
  types.User(
      id: 'Leoš Janacek',
      lastName: 'レオシュ・ヤナーチェク',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Leos_Janacek_relief.jpg/135px-Leos_Janacek_relief.jpg'),
  types.User(
      id:
          'Emperor Temmu (hereditary title; orig. one of the two highest such titles, later demoted to sixth highest of eight)',
      lastName: '天武天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Emperor_Tenmu.jpg/300px-Emperor_Tenmu.jpg'),
  types.User(
      id: 'Fujiwara Fuhito (third highest of the eight hereditary titles)',
      lastName: '藤原不比等',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Fujiwara-Fuhito.jpg/230px-Fujiwara-Fuhito.jpg'),
  types.User(
      id:
          'Emperor Shomu (hereditary title; orig. one of the two highest such titles, later demoted to sixth highest of eight)',
      lastName: '聖武天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Emperor_Shomu.jpg/250px-Emperor_Shomu.jpg'),
  types.User(
      id: 'religious service (usu. Buddhist)',
      lastName: '行基',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Gyouki_1.jpg/260px-Gyouki_1.jpg'),
  types.User(
      id: 'Amitabha Buddha in a pre-enlightenment incarnation',
      lastName: '鑑真',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Ganjin_wajyo_portrait.JPG/220px-Ganjin_wajyo_portrait.JPG'),
  types.User(
      id: 'tiger beetle (esp. the Japanese tiger beetle, Cicindela japonica)',
      lastName: '道鏡',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Signature_Manuscript_Dokyo_ACE763.JPG/120px-Signature_Manuscript_Dokyo_ACE763.JPG'),
  types.User(
      id: 'Emperor Kammu (formerly Kammu Emperor Kammu)',
      lastName: '桓武天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Emperor_Kammu_large.jpg/225px-Emperor_Kammu_large.jpg'),
  types.User(
      id: 'Sakagami Tamuramaro',
      lastName: '坂上田村麻呂',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Sakanoue_Tamuramaro_sw.jpg/250px-Sakanoue_Tamuramaro_sw.jpg'),
  types.User(
      id: 'the most obvious',
      lastName: '最澄',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/%E6%9C%80%E6%BE%84%E5%83%8F_%E4%B8%80%E4%B9%97%E5%AF%BA%E8%94%B5_%E5%B9%B3%E5%AE%89%E6%99%82%E4%BB%A3.jpg/250px-%E6%9C%80%E6%BE%84%E5%83%8F_%E4%B8%80%E4%B9%97%E5%AF%BA%E8%94%B5_%E5%B9%B3%E5%AE%89%E6%99%82%E4%BB%A3.jpg'),
  types.User(
      id: 'Kukai (name of a Buddhist priest)',
      lastName: '空海',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/9/98/Kobo_Daishi_%28Taisanji_Matsuyama%29.jpg'),
  types.User(
      id: 'Fujiwara no Yoshifusa',
      lastName: '藤原良房',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Fujiwara_no_Yoshifusa.jpg/220px-Fujiwara_no_Yoshifusa.jpg'),
  types.User(
      id: 'Sugawara no Michizane',
      lastName: '菅原道真',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Sugawara_Michizane.jpg/200px-Sugawara_Michizane.jpg'),
  types.User(
      id: 'Taira-no-Masakado',
      lastName: '平将門',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Taira_no_Masakado_01.jpg/250px-Taira_no_Masakado_01.jpg'),
  types.User(
      id: 'Fujiwara Junyu',
      lastName: '藤原純友',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Fujiwara_no_Sumitomo.jpg/200px-Fujiwara_no_Sumitomo.jpg'),
  types.User(
      id: 'medium-ranked councillor in the Department of State',
      lastName: '清少納言',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/6/6f/Sei_Shonagon2.jpg'),
  types.User(
      id: 'Japanese beautyberry (Callicarpa japonica)',
      lastName: '紫式部',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Murasaki-Shikibu-composing-Genji-Monogatari.png/200px-Murasaki-Shikibu-composing-Genji-Monogatari.png'),
  types.User(
      id: 'Fujiwara no Michinaga',
      lastName: '藤原道長',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/f/f3/Fujiwaranomichinaga.jpg'),
  types.User(
      id: 'Fujiwara no Yorimichi',
      lastName: '藤原頼通',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Fujiwara_Yorimichi.JPG/200px-Fujiwara_Yorimichi.JPG'),
  types.User(
      id: 'Later Three Emperors (mythological, legendary, or legendary)',
      lastName: '後三条天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Emperor_Gosanj%C5%8D.jpg/225px-Emperor_Gosanj%C5%8D.jpg'),
  types.User(
      id: 'Shirakawa Emperor',
      lastName: '白河天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Emperor_Shirakawa.jpg/250px-Emperor_Shirakawa.jpg'),
  types.User(
      id: 'Minamoto no Yoshie',
      lastName: '源義家',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Minamoto_no_Yoshiie.jpg/250px-Minamoto_no_Yoshiie.jpg'),
  types.User(
      id: 'Kiyomori (shogun)',
      lastName: '平清盛',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Taira_no_Kiyomori%2CTenshiSekkanMiei.jpg/270px-Taira_no_Kiyomori%2CTenshiSekkanMiei.jpg'),
  types.User(
      id: 'Minamoto no Yoshitomo',
      lastName: '源義朝',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/%E5%85%83%E5%B9%B3%E6%B2%BB%E5%90%88%E6%88%A6%E6%BA%90%E7%BE%A9%E6%9C%9D%E7%99%BD%E6%B2%B3%E6%AE%BF%E5%A4%9C%E8%A8%8E%E4%B9%8B%E5%9B%B3.jpg/200px-%E5%85%83%E5%B9%B3%E6%B2%BB%E5%90%88%E6%88%A6%E6%BA%90%E7%BE%A9%E6%9C%9D%E7%99%BD%E6%B2%B3%E6%AE%BF%E5%A4%9C%E8%A8%8E%E4%B9%8B%E5%9B%B3.jpg'),
  types.User(
      id: 'Later Hakugawa Emperor (1868-1868 CE)',
      lastName: '後白河天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Emperor_Go-Shirakawa2.jpg/270px-Emperor_Go-Shirakawa2.jpg'),
  types.User(
      id: 'Minamoto Yoshitsune',
      lastName: '源義経',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Minamoto_no_Yoshitsune.jpg/250px-Minamoto_no_Yoshitsune.jpg'),
  types.User(
      id: 'Minamoto no Yoritomo',
      lastName: '源頼朝',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Minamoto_no_Yoritomo.jpg/250px-Minamoto_no_Yoritomo.jpg'),
  types.User(
      id: 'Hojo Masako',
      lastName: '北条政子',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Hojo_Masako.jpg/200px-Hojo_Masako.jpg'),
  types.User(
      id: 'Later Toba Emperor (Emperor Go-Toba)',
      lastName: '後鳥羽天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Emperor_Go-Toba.jpg/250px-Emperor_Go-Toba.jpg'),
  types.User(
      id: 'Hojo Yasuji',
      lastName: '北条泰時',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/YASUTOKI_NISHIKI.PNG/250px-YASUTOKI_NISHIKI.PNG'),
  types.User(
      id: 'Hojo Tokiyori',
      lastName: '北条時頼',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/H%C5%8Dj%C5%8D_Tokiyori.jpg/170px-H%C5%8Dj%C5%8D_Tokiyori.jpg'),
  types.User(
      id: 'Hojo Tokimune',
      lastName: '北条時宗',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/H%C5%8Dj%C5%8D_Tokimune.jpg/200px-H%C5%8Dj%C5%8D_Tokimune.jpg'),
  types.User(
      id: 'kubilai (variety of Jewish music)',
      lastName: 'クビライ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/YuanEmperorAlbumKhubilaiPortrait.jpg/250px-YuanEmperorAlbumKhubilaiPortrait.jpg'),
  types.User(
      id: 'Later Daigo Tenno',
      lastName: '後醍醐天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Emperor_Godaigo.jpg/250px-Emperor_Godaigo.jpg'),
  types.User(
      id: 'Kusunoki Masanari',
      lastName: '楠木正成',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Kusunoki_Masashige.jpg/230px-Kusunoki_Masashige.jpg'),
  types.User(
      id: 'Nitta Yoshisada',
      lastName: '新田義貞',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/%E6%96%B0%E7%94%B0%E7%BE%A9%E8%B2%9E%E5%85%AC%E8%82%96%E5%83%8F.jpg/250px-%E6%96%B0%E7%94%B0%E7%BE%A9%E8%B2%9E%E5%85%AC%E8%82%96%E5%83%8F.jpg'),
  types.User(
      id: 'Ashikaga Takauji (second highest of the eight hereditary titles)',
      lastName: '足利尊氏',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Ashikaga_Takauji_J%C5%8Ddo-ji.jpg/250px-Ashikaga_Takauji_J%C5%8Ddo-ji.jpg'),
  types.User(
      id: 'Ashikaga Yoshimitsu',
      lastName: '足利義満',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Yoshimitsu_Ashikaga_cropped.jpg/250px-Yoshimitsu_Ashikaga_cropped.jpg'),
  types.User(
      id: 'Zeami',
      lastName: '世阿弥',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/2/28/Zo%27onna_Noh_Mask%2C_Edo_period%2C_18th_century%2C_wood_with_polychromy_-_Tokyo_National_Museum_-_DSC06166.JPG'),
  types.User(
      id: 'Ashikaga Yoshimasa (i.e. the Muromachi shogun, 1336-1573 CE)',
      lastName: '足利義政',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Ashikaga_Yoshimasa.jpg/260px-Ashikaga_Yoshimasa.jpg'),
  types.User(
      id: 'skipper of a snow boat',
      lastName: '雪舟',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Portrait_of_Sesshu.jpg/220px-Portrait_of_Sesshu.jpg'),
  types.User(
      id: 'Ikkyu Soujun',
      lastName: '一休宗純',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/4/40/Portrait_of_Ikky%C5%AB_by_Bokusai.jpg'),
  types.User(
      id: 'Francisco Xavier',
      lastName: 'フランシスコ・ザビエル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Franciscus_de_Xabier.jpg/250px-Franciscus_de_Xabier.jpg'),
  types.User(
      id: 'Houjou Soun',
      lastName: '北条早雲',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Soun_Hojo_portrait.jpg/250px-Soun_Hojo_portrait.jpg'),
  types.User(
      id: 'Doso Saito',
      lastName: '斎藤道三',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Saito-Dozan-2.jpg/230px-Saito-Dozan-2.jpg'),
  types.User(
      id: 'Mori Motoki (second highest of the eight hereditary titles)',
      lastName: '毛利元就',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Mori_Motonari.jpg/250px-Mori_Motonari.jpg'),
  types.User(
      id: 'Takeda Shingen',
      lastName: '武田信玄',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Takeda_Harunobu.jpg/250px-Takeda_Harunobu.jpg'),
  types.User(
      id: 'Kenshin Uesugi (guardian deity of women)',
      lastName: '上杉謙信',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Uesugi_Kenshin_Portrait_from_Uesugi_Shrine.png/250px-Uesugi_Kenshin_Portrait_from_Uesugi_Shrine.png'),
  types.User(
      id: 'Oda Nobunaga',
      lastName: '織田信長',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Oda-Nobunaga.jpg/250px-Oda-Nobunaga.jpg'),
  types.User(
      id: 'Ashikaga Yoshiaki',
      lastName: '足利義昭',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Ashikaga_Yoshiaki.jpg/260px-Ashikaga_Yoshiaki.jpg'),
  types.User(
      id: 'Akechi Mitsuhide (famous for his works)',
      lastName: '明智光秀',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Akechi_Mitsuhide2.jpg/250px-Akechi_Mitsuhide2.jpg'),
  types.User(
      id: 'Toyotomi Hideyoshi',
      lastName: '豊臣秀吉',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Toyotomi_Hideyoshi_c1598_Kodai-ji_Temple.png/250px-Toyotomi_Hideyoshi_c1598_Kodai-ji_Temple.png'),
  types.User(
      id: 'Senriku Rikyuu era (1455.7.13-1457.9.28)',
      lastName: '千利休',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Sen_no_Rikyu_JPN.jpg/200px-Sen_no_Rikyu_JPN.jpg'),
  types.User(
      id:
          'Ishida Mitsunari (Ichida Mitsunari, the grand master of the game of go)',
      lastName: '石田三成',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Ishida_Mitsunari.jpg/250px-Ishida_Mitsunari.jpg'),
  types.User(
      id: 'lord of stagnation',
      lastName: '淀君',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Yodo-dono_cropped.jpg/250px-Yodo-dono_cropped.jpg'),
  types.User(
      id: 'Hideyori Toyotomi Hideyori (1582-1582)',
      lastName: '豊臣秀頼',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Hideyori_Toyotomi.jpg/250px-Hideyori_Toyotomi.jpg'),
  types.User(
      id: 'Date Masamune',
      lastName: '伊達政宗',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Date_Masamune02.jpg/280px-Date_Masamune02.jpg'),
  types.User(
      id: 'Tokugawa Ieyasu (lords of the Tokugawa shogunate)',
      lastName: '徳川家康',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Tokugawa_Ieyasu2.JPG/270px-Tokugawa_Ieyasu2.JPG'),
  types.User(
      id: 'Tokugawa Iemitsu',
      lastName: '徳川家光',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Iemitu.jpg/250px-Iemitu.jpg'),
  types.User(
      id: 'Shiro Amakusa',
      lastName: '天草四郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Amakusa_Shiro.jpg/220px-Amakusa_Shiro.jpg'),
  types.User(
      id: 'Tsunayoshi Tokugawa',
      lastName: '徳川綱吉',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Tsunyaoshi.jpg/250px-Tsunyaoshi.jpg'),
  types.User(
      id: 'Arai white stone',
      lastName: '新井白石',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Arai_Hakuseki_-_Japanischer_Gelehrter.jpg/250px-Arai_Hakuseki_-_Japanischer_Gelehrter.jpg'),
  types.User(
      id: 'Yoshimune Tokugawa',
      lastName: '徳川吉宗',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Tokugawa_Yoshimune.jpg/260px-Tokugawa_Yoshimune.jpg'),
  types.User(
      id: 'Ooka Tadasama',
      lastName: '大岡忠相',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Oooka_tadasuke.jpg/250px-Oooka_tadasuke.jpg'),
  types.User(
      id: 'Honii Nobunaga',
      lastName: '本居宣長',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Motoori_Norinaga_self_portrait.jpg/230px-Motoori_Norinaga_self_portrait.jpg'),
  types.User(
      id: 'Tanuma Iiji',
      lastName: '田沼意次',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Tanuma_Okitsugu2.jpg/250px-Tanuma_Okitsugu2.jpg'),
  types.User(
      id: 'Matsudaira Sadanobu',
      lastName: '松平定信',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Matsudaira_Sadanobu.jpg/250px-Matsudaira_Sadanobu.jpg'),
  types.User(
      id: 'Heihachiro Oshio',
      lastName: '大塩平八郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Oshio_Heihachiro.jpg/250px-Oshio_Heihachiro.jpg'),
  types.User(
      id: 'Tadakuni Mizuno',
      lastName: '水野忠邦',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Mizuno_Tadakuni.jpg/300px-Mizuno_Tadakuni.jpg'),
  types.User(
      id: 'Matthew Perry',
      lastName: 'マシュー・ペリー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Commodore_Matthew_Calbraith_Perry.png/250px-Commodore_Matthew_Calbraith_Perry.png'),
  types.User(
      id: 'Ii Naosuke',
      lastName: '井伊直弼',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Ii_Naosuke.jpg/250px-Ii_Naosuke.jpg'),
  types.User(
      id: 'Yoshida Shoin era (1624.2.30-1644.12.16)',
      lastName: '吉田松陰',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Yoshida_Shoin2.jpg/250px-Yoshida_Shoin2.jpg'),
  types.User(
      id: 'Tokachi Kaisyu',
      lastName: '勝海舟',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Kaishu_Katsu_2.jpg/200px-Kaishu_Katsu_2.jpg'),
  types.User(
      id: 'Shimazu Nariakira',
      lastName: '島津斉彬',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Nariakira_Shimazu.png/200px-Nariakira_Shimazu.png'),
  types.User(
      id: 'Sakamoto Ryoma',
      lastName: '坂本龍馬',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Sakamoto_Ryoma.jpg/250px-Sakamoto_Ryoma.jpg'),
  types.User(
      id: 'Keiki Tokugawa',
      lastName: '徳川慶喜',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/YoshinobuTokugawa.jpg/200px-YoshinobuTokugawa.jpg'),
  types.User(
      id: 'Emperor Meiji',
      lastName: '明治天皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Emperor_Meiji_in_1873.jpg/230px-Emperor_Meiji_in_1873.jpg'),
  types.User(
      id: 'Okubo Toshimichi',
      lastName: '大久保利通',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Toshimichi_Okubo_4.jpg/200px-Toshimichi_Okubo_4.jpg'),
  types.User(
      id: 'Kido Kouyoshi',
      lastName: '木戸孝允',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Takayoshi_Kido_suit.jpg/500px-Takayoshi_Kido_suit.jpg'),
  types.User(
      id: 'Saigo Takamori',
      lastName: '西郷隆盛',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Saigo_Takamori_Portrait_by_Ishikawa_Shizumasa.jpg/250px-Saigo_Takamori_Portrait_by_Ishikawa_Shizumasa.jpg'),
  types.User(
      id: 'Gusaku Iwakura (god of wealth, music, eloquence and water)',
      lastName: '岩倉具視',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Tomomi_Iwakura_3.jpg/220px-Tomomi_Iwakura_3.jpg'),
  types.User(
      id: 'Hirobumi Ito',
      lastName: '伊藤博文',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/IT%C5%8C_Hirobumi.jpg/220px-IT%C5%8C_Hirobumi.jpg'),
  types.User(
      id: 'Fukuzawa Yukichi',
      lastName: '福沢諭吉',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Yukichi_Fukuzawa_1891.jpg/200px-Yukichi_Fukuzawa_1891.jpg'),
  types.User(
      id: 'Itagaki Tasuke',
      lastName: '板垣退助',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/ITAGAKI_Taisuke.jpg/220px-ITAGAKI_Taisuke.jpg'),
  types.User(
      id: 'Shigenobu Okuma',
      lastName: '大隈重信',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Shigenobu_Okuma_5.jpg/220px-Shigenobu_Okuma_5.jpg'),
  types.User(
      id: 'Mutsu Munemitsu',
      lastName: '陸奥宗光',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Mutsu_Munemitsu.jpg/200px-Mutsu_Munemitsu.jpg'),
  types.User(
      id: 'Kotaro Komura',
      lastName: '小村寿太郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Komura_Jutaro.jpg/200px-Komura_Jutaro.jpg'),
  types.User(
      id: 'Heihachiro Togo',
      lastName: '東郷平八郎',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/T%C5%8Dg%C5%8D_Heihachir%C5%8D.jpg/260px-T%C5%8Dg%C5%8D_Heihachir%C5%8D.jpg'),
  types.User(
      id: 'Kiyoshi Shiga',
      lastName: '志賀潔',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Kiyoshi_Shiga.jpg/220px-Kiyoshi_Shiga.jpg'),
  types.User(
      id: 'Tanaka Shozo',
      lastName: '田中正造',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Tanaka_Shozo.jpg/200px-Tanaka_Shozo.jpg'),
  types.User(
      id: 'Saionji Koumou era (1257.3.14-1259.3.26)',
      lastName: '西園寺公望',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Kinmochi_Saionji_2.jpg/220px-Kinmochi_Saionji_2.jpg'),
  types.User(
      id: 'Hideyo Noguchi',
      lastName: '野口英世',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Noguchi_Hideyo.jpg/225px-Noguchi_Hideyo.jpg'),
  types.User(
      id: 'Yukio Ozaki',
      lastName: '尾崎行雄',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Yukio_Ozaki.jpg/250px-Yukio_Ozaki.jpg'),
  types.User(
      id: 'original salutation',
      lastName: '原敬',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Takashi_Hara_formal.jpg/220px-Takashi_Hara_formal.jpg'),
  types.User(
      id: 'Takeshi Inuyo (second highest of the eight hereditary titles)',
      lastName: '犬養毅',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Inukai_Tsuyoshi.jpg/220px-Inukai_Tsuyoshi.jpg'),
  types.User(
      id: 'Isoroku Yamamoto',
      lastName: '山本五十六',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Portrait_of_Yamamoto_Isoroku.jpg/255px-Portrait_of_Yamamoto_Isoroku.jpg'),
  types.User(
      id: 'Douglas MacArthur.',
      lastName: 'ダグラス・マッカーサー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/MacArthur_Manila.jpg/240px-MacArthur_Manila.jpg'),
  types.User(
      id: 'Shigeru Yoshida',
      lastName: '吉田茂',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Shigeru_Yoshida_suit.jpg/200px-Shigeru_Yoshida_suit.jpg'),
  types.User(
      id: 'George Barkley.',
      lastName: 'ジョージ・バークリー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/George_Berkeley_by_John_Smibert.jpg/200px-George_Berkeley_by_John_Smibert.jpg'),
  types.User(
      id: 'Benjamin Franklin.',
      lastName: 'ベンジャミン・フランクリン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/BenFranklinDuplessis.jpg/200px-BenFranklinDuplessis.jpg'),
  types.User(
      id: 'Helen Keller.',
      lastName: 'ヘレン・ケラー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Helen_KellerA.jpg/220px-Helen_KellerA.jpg'),
  types.User(
      id: 'John F. Kennedy',
      lastName: 'ジョン・F・ケネディ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/John_F._Kennedy%2C_White_House_color_photo_portrait.jpg/220px-John_F._Kennedy%2C_White_House_color_photo_portrait.jpg'),
  types.User(
      id: 'Martin Luther King Jr.',
      lastName: 'マーティン・ルーサー・キング・ジュニア',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Martin_Luther_King_Jr_NYWTS.jpg/300px-Martin_Luther_King_Jr_NYWTS.jpg'),
  types.User(
      id: 'Franklin D. Roosevelt.',
      lastName: 'フランクリン・ルーズベルト',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/FDR_1944_Color_Portrait.jpg/250px-FDR_1944_Color_Portrait.jpg'),
  types.User(
      id: 'Che Guevara',
      lastName: 'チェ・ゲバラ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/CheHigh.jpg/200px-CheHigh.jpg'),
  types.User(
      id: 'Victoria (Queen of England)',
      lastName: 'ヴィクトリア (イギリス女王)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Queen_Victoria_-Golden_Jubilee_-3a_cropped.JPG/200px-Queen_Victoria_-Golden_Jubilee_-3a_cropped.JPG'),
  types.User(
      id: 'Florence Nightingale.',
      lastName: 'フローレンス・ナイチンゲール',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Florence_Nightingale_CDV_by_H_Lenthall.jpg/220px-Florence_Nightingale_CDV_by_H_Lenthall.jpg'),
  types.User(
      id: 'William Shakespeare.',
      lastName: 'ウィリアム・シェイクスピア',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/CHANDOS3.jpg/200px-CHANDOS3.jpg'),
  types.User(
      id: 'Winston Churchill',
      lastName: 'ウィンストン・チャーチル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Disambig_gray.svg/25px-Disambig_gray.svg.png'),
  types.User(
      id: 'Charles Chaplin.',
      lastName: 'チャールズ・チャップリン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Charlie_Chaplin_portrait.jpg/220px-Charlie_Chaplin_portrait.jpg'),
  types.User(
      id: 'Arthur Conan Doyle',
      lastName: 'アーサー・コナン・ドイル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Conan_doyle.jpg/250px-Conan_doyle.jpg'),
  types.User(
      id: 'Adam Smith',
      lastName: 'アダム・スミス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/AdamSmith.jpg/200px-AdamSmith.jpg'),
  types.User(
      id: 'Michelangelo Buonarroti',
      lastName: 'ミケランジェロ・ブオナローティ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Miguel_%C3%81ngel%2C_por_Daniele_da_Volterra_%28detalle%29.jpg/220px-Miguel_%C3%81ngel%2C_por_Daniele_da_Volterra_%28detalle%29.jpg'),
  types.User(
      id: 'Raffaello Santi',
      lastName: 'ラファエロ・サンティ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Raffaello_Sanzio.jpg/220px-Raffaello_Sanzio.jpg'),
  types.User(
      id: 'Sandro Botticelli',
      lastName: 'サンドロ・ボッティチェッリ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Sandro_Botticelli_083.jpg/220px-Sandro_Botticelli_083.jpg'),
  types.User(
      id: 'Benito Mussolini',
      lastName: 'ベニート・ムッソリーニ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Mussolini_biografia.jpg/220px-Mussolini_biografia.jpg'),
  types.User(
      id: 'Dante Alighieri.',
      lastName: 'ダンテ・アリギエーリ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Portrait_de_Dante.jpg/200px-Portrait_de_Dante.jpg'),
  types.User(
      id: 'Lorenzo de Medici',
      lastName: 'ロレンツォ・デ・メディチ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Confusion_grey.svg/25px-Confusion_grey.svg.png'),
  types.User(
      id: 'Pietro Mascagni',
      lastName: 'ピエトロ・マスカーニ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Pietro_Mascagni_2.jpg/220px-Pietro_Mascagni_2.jpg'),
  types.User(
      id: 'Tintoretto.',
      lastName: 'ティントレット',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Tintorettoselfportrait.jpg/250px-Tintorettoselfportrait.jpg'),
  types.User(
      id: 'Michelangelo Merisi da Caravaggio',
      lastName: 'ミケランジェロ・メリージ・ダ・カラヴァッジオ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Bild-Ottavio_Leoni%2C_Caravaggio.jpg/200px-Bild-Ottavio_Leoni%2C_Caravaggio.jpg'),
  types.User(
      id: 'Filippo Lippi',
      lastName: 'フィリッポ・リッピ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Fra_Filippo_Lippi_007.1.jpg/220px-Fra_Filippo_Lippi_007.1.jpg'),
  types.User(
      id: 'Girolamo Savonarola',
      lastName: 'ジロラモ・サヴォナローラ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/GirolamoSavonarola.jpg/200px-GirolamoSavonarola.jpg'),
  types.User(
      id: 'Paolo Veronese',
      lastName: 'パオロ・ヴェロネーゼ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Paolo_Veronese%2C_avtoportret.jpg/220px-Paolo_Veronese%2C_avtoportret.jpg'),
  types.User(
      id: 'Giorgio Vasari',
      lastName: 'ジョルジョ・ヴァザーリ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Giorgio_Vasari_Selbstportr%C3%A4t.jpg/220px-Giorgio_Vasari_Selbstportr%C3%A4t.jpg'),
  types.User(
      id: 'Moses',
      lastName: 'モーセ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Moses_%28Michaelangelo_-_San_Pietro_in_Vincoli_-_Rome%29.jpg/250px-Moses_%28Michaelangelo_-_San_Pietro_in_Vincoli_-_Rome%29.jpg'),
  types.User(
      id: 'Richard I (King of England)',
      lastName: 'リチャード1世 (イングランド王)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/4/49/Richard_coeurdelion_g.jpg'),
  types.User(
      id: 'Elizabeth I (Queen of England)',
      lastName: 'エリザベス1世 (イングランド女王)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Elizabeth1England.jpg/250px-Elizabeth1England.jpg'),
  types.User(
      id: 'Oliver Cromwell.',
      lastName: 'オリバー・クロムウェル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Oliver_Cromwell_by_Samuel_Cooper.jpg/220px-Oliver_Cromwell_by_Samuel_Cooper.jpg'),
  types.User(
      id: 'King Ashoka',
      lastName: 'アショーカ王',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Indian_relief_from_Amaravati%2C_Guntur._Preserved_in_Guimet_Museum.jpg/200px-Indian_relief_from_Amaravati%2C_Guntur._Preserved_in_Guimet_Museum.jpg'),
  types.User(
      id: 'Mahatma Gandhi',
      lastName: 'マハトマ・ガンディー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Portrait_Gandhi.jpg/250px-Portrait_Gandhi.jpg'),
  types.User(
      id: 'Shakyamuni',
      lastName: '釈迦',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Buddha_in_Sarnath_Museum_%28Dhammajak_Mutra%29.jpg/240px-Buddha_in_Sarnath_Museum_%28Dhammajak_Mutra%29.jpg'),
  types.User(
      id: 'Marco Polo',
      lastName: 'マルコ・ポーロ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Marco_Polo_portrait.jpg/220px-Marco_Polo_portrait.jpg'),
  types.User(
      id: 'Ramses II',
      lastName: 'ラムセス2世',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/RamsesIIEgypt.jpg/220px-RamsesIIEgypt.jpg'),
  types.User(
      id: 'Salahuddin.',
      lastName: 'サラーフッディーン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Portrait_of_Saladin_%28before_A.D._1185%3B_short%29.jpg/225px-Portrait_of_Saladin_%28before_A.D._1185%3B_short%29.jpg'),
  types.User(
      id: 'kufu',
      lastName: 'クフ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Kairo_Museum_Statuette_Cheops_03_%28cropped%29.jpg/220px-Kairo_Museum_Statuette_Cheops_03_%28cropped%29.jpg'),
  types.User(
      id: 'Eliezabeth (Empress of Austria)',
      lastName: 'エリーザベト (オーストリア皇后)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Erzsebet_kiralyne_photo_1867.jpg/200px-Erzsebet_kiralyne_photo_1867.jpg'),
  types.User(
      id: 'Sigmund Freud.',
      lastName: 'ジークムント・フロイト',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Sigmund_Freud_LIFE.jpg/225px-Sigmund_Freud_LIFE.jpg'),
  types.User(
      id: 'Maria Theresa',
      lastName: 'マリア・テレジア',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Kaiserin_Maria_Theresia_%28HRR%29.jpg/220px-Kaiserin_Maria_Theresia_%28HRR%29.jpg'),
  types.User(
      id: 'Franz Joseph Haydn',
      lastName: 'フランツ・ヨーゼフ・ハイドン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Haydn_portrait_by_Thomas_Hardy_%28small%29.jpg/220px-Haydn_portrait_by_Thomas_Hardy_%28small%29.jpg'),
  types.User(
      id: 'Wolfgang Amadeus Mozart',
      lastName: 'ヴォルフガング・アマデウス・モーツァルト',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Wolfgang-amadeus-mozart_1.jpg/200px-Wolfgang-amadeus-mozart_1.jpg'),
  types.User(
      id: 'Anton Bruckner.',
      lastName: 'アントン・ブルックナー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Bruckner_final_years.jpg/220px-Bruckner_final_years.jpg'),
  types.User(
      id: 'Johann Strauss II',
      lastName: 'ヨハン・シュトラウス2世',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Johann_Strauss_II_1890.jpg/220px-Johann_Strauss_II_1890.jpg'),
  types.User(
      id: 'Vincent van Gogh',
      lastName: 'フィンセント・ファン・ゴッホ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/VanGogh_1887_Selbstbildnis.jpg/250px-VanGogh_1887_Selbstbildnis.jpg'),
  types.User(
      id: 'Barouf de Spinoza.',
      lastName: 'バールーフ・デ・スピノザ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Spinoza.jpg/200px-Spinoza.jpg'),
  types.User(
      id: 'Suleiman I.',
      lastName: 'スレイマン1世',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/EmperorSuleiman.jpg/200px-EmperorSuleiman.jpg'),
  types.User(
      id: 'Hannibal',
      lastName: 'ハンニバル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Hannibal_Slodtz_Louvre_MR2093.jpg/200px-Hannibal_Slodtz_Louvre_MR2093.jpg'),
  types.User(
      id: 'Alexander III',
      lastName: 'アレクサンドロス3世',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Istanbul_-_Museo_archeol._-_Alessandro_Magno_%28firmata_Menas%29_-_sec._III_a.C._-_da_Magnesia_-_Foto_G._Dall%27Orto_28-5-2006_b-n.jpg/200px-Istanbul_-_Museo_archeol._-_Alessandro_Magno_%28firmata_Menas%29_-_sec._III_a.C._-_da_Magnesia_-_Foto_G._Dall%27Orto_28-5-2006_b-n.jpg'),
  types.User(
      id: 'Felipe II (King of Spain)',
      lastName: 'フェリペ2世 (スペイン王)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/King_PhilipII_of_Spain.jpg/200px-King_PhilipII_of_Spain.jpg'),
  types.User(
      id: 'Francisco Pizarro',
      lastName: 'フランシスコ・ピサロ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Pizarro.jpg/250px-Pizarro.jpg'),
  types.User(
      id: 'Hernan Cortez.',
      lastName: 'エルナン・コルテス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Retrato_de_Hern%C3%A1n_Cort%C3%A9s.jpg/220px-Retrato_de_Hern%C3%A1n_Cort%C3%A9s.jpg'),
  types.User(
      id: 'Francisco de Goya',
      lastName: 'フランシスコ・デ・ゴヤ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Vicente_L%C3%B3pez_Porta%C3%B1a_-_el_pintor_Francisco_de_Goya.jpg/220px-Vicente_L%C3%B3pez_Porta%C3%B1a_-_el_pintor_Francisco_de_Goya.jpg'),
  types.User(
      id: 'Pablo Picasso',
      lastName: 'パブロ・ピカソ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Pablo_picasso_1.jpg/230px-Pablo_picasso_1.jpg'),
  types.User(
      id: 'Christina.',
      lastName: 'クリスティーナ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Disambig_gray.svg/30px-Disambig_gray.svg.png'),
  types.User(
      id: 'Carl Zumberg.',
      lastName: 'カール・ツンベルク',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/f/f5/Carl_Peter_Thunberg.jpg'),
  types.User(
      id: 'Vladimir Lenin',
      lastName: 'ウラジーミル・レーニン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Vladimir_Lenin.jpg/200px-Vladimir_Lenin.jpg'),
  types.User(
      id: 'Joseph Stalin',
      lastName: 'ヨシフ・スターリン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Josef_Stalin_-_NARA_-_198797.jpg/220px-Josef_Stalin_-_NARA_-_198797.jpg'),
  types.User(
      id: 'Yuriy Gagarin.',
      lastName: 'ユーリイ・ガガーリン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/c/cc/Gagarin_in_Sweden.jpg'),
  types.User(
      id: 'Sekifu (lowest of the eight hereditary titles)',
      lastName: '関羽',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Guanyu.jpg/200px-Guanyu.jpg'),
  types.User(
      id: 'Zhang Liang',
      lastName: '張良',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Zhang_Liang.jpg/220px-Zhang_Liang.jpg'),
  types.User(
      id: 'Cao Cao',
      lastName: '曹操',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Cao_Cao_scth.jpg/220px-Cao_Cao_scth.jpg'),
  types.User(
      id: 'Liu Bei',
      lastName: '劉備',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Liu_Bei_Tang.jpg/170px-Liu_Bei_Tang.jpg'),
  types.User(
      id: 'Sun Quan (dynasty of China; 386-534 CE)',
      lastName: '孫権',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Sun_Quan_Tang.jpg/240px-Sun_Quan_Tang.jpg'),
  types.User(
      id: 'Genjo (era 1688.9.30-1704.3.13)',
      lastName: '玄奘',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Xuanzang_w.jpg/150px-Xuanzang_w.jpg'),
  types.User(
      id: 'Yi Paikou era (1113.7.13-1118.4.3)',
      lastName: '李白',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Libai_touxiang.jpg/200px-Libai_touxiang.jpg'),
  types.User(
      id:
          'Shiba Sangon (Sino-Japanese esoteric Buddhism, originating in the eighth century)',
      lastName: '司馬遷',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Si_maqian.jpg/220px-Si_maqian.jpg'),
  types.User(
      id: 'Confucius',
      lastName: '孔子',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/2/2d/Confucius_02.png'),
  types.User(
      id: 'Qin Shi Huang ("the First Qin Emperor")',
      lastName: '秦始皇',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Qinshihuang.jpg/320px-Qinshihuang.jpg'),
  types.User(
      id: 'Zhu Yuanzhang.',
      lastName: '朱元璋',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/%E6%98%8E%E5%A4%AA%E7%A5%96%E7%94%BB%E5%83%8F.jpg/200px-%E6%98%8E%E5%A4%AA%E7%A5%96%E7%94%BB%E5%83%8F.jpg'),
  types.User(
      id: 'To Fu Fu',
      lastName: '杜甫',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Du_Fu.jpg/250px-Du_Fu.jpg'),
  types.User(
      id: 'Sun Yat-sen',
      lastName: '孫中山',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Confusion_grey.svg/25px-Confusion_grey.svg.png'),
  types.User(
      id: 'Mao Zedong',
      lastName: '毛沢東',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Mao_Zedong_1959.jpg/220px-Mao_Zedong_1959.jpg'),
  types.User(
      id: 'Richard Wagner',
      lastName: 'リヒャルト・ワーグナー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/RichardWagner.jpg/220px-RichardWagner.jpg'),
  types.User(
      id: 'Martin Luther',
      lastName: 'マルティン・ルター',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Lucas_Cranach_%28I%29_workshop_-_Martin_Luther_%28Uffizi%29.jpg/200px-Lucas_Cranach_%28I%29_workshop_-_Martin_Luther_%28Uffizi%29.jpg'),
  types.User(
      id: 'Johann Sebastian Bach',
      lastName: 'ヨハン・ゼバスティアン・バッハ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Johann_Sebastian_Bach.png/200px-Johann_Sebastian_Bach.png'),
  types.User(
      id: 'Ludwig van Beethoven',
      lastName: 'ルートヴィヒ・ヴァン・ベートーヴェン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Beethoven.jpg/200px-Beethoven.jpg'),
  types.User(
      id: 'Karl Marx',
      lastName: 'カール・マルクス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Marx7.jpg/200px-Marx7.jpg'),
  types.User(
      id: 'Immanuel Canto.',
      lastName: 'イマヌエル・カント',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Kant_gemaelde_1.jpg/250px-Kant_gemaelde_1.jpg'),
  types.User(
      id: 'Georg Wilhelm Friedrich Hegel',
      lastName: 'ゲオルク・ヴィルヘルム・フリードリヒ・ヘーゲル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Hegel_portrait_by_Schlesinger_1831.jpg/200px-Hegel_portrait_by_Schlesinger_1831.jpg'),
  types.User(
      id: 'Friedrich Nietzsche',
      lastName: 'フリードリヒ・ニーチェ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Nietzsche1882.jpg/200px-Nietzsche1882.jpg'),
  types.User(
      id: 'Artur Schopenhauer',
      lastName: 'アルトゥル・ショーペンハウアー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Arthur_Schopenhauer_Portrait_by_Ludwig_Sigismund_Ruhl_1815.jpeg/240px-Arthur_Schopenhauer_Portrait_by_Ludwig_Sigismund_Ruhl_1815.jpeg'),
  types.User(
      id: 'Engelbert Kempel',
      lastName: 'エンゲルベルト・ケンペル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Engelbert_Kaempfer.jpg/115px-Engelbert_Kaempfer.jpg'),
  types.User(
      id: 'Anne Frank',
      lastName: 'アンネ・フランク',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/AnneFrankSchoolPhoto.jpg/220px-AnneFrankSchoolPhoto.jpg'),
  types.User(
      id: 'Felix Mendelssohn',
      lastName: 'フェリックス・メンデルスゾーン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Mendelssohn_Bartholdy.jpg/220px-Mendelssohn_Bartholdy.jpg'),
  types.User(
      id: 'Carl Maria von Weber',
      lastName: 'カール・マリア・フォン・ウェーバー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Carl_Maria_von_Weber.jpg/220px-Carl_Maria_von_Weber.jpg'),
  types.User(
      id: 'Justinian I',
      lastName: 'ユスティニアヌス1世',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Meister_von_San_Vitale_in_Ravenna.jpg/200px-Meister_von_San_Vitale_in_Ravenna.jpg'),
  types.User(
      id: 'Gaius Julius Caesar',
      lastName: 'ガイウス・ユリウス・カエサル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Julius_Caesar_Coustou_Louvre_MR1798.jpg/500px-Julius_Caesar_Coustou_Louvre_MR1798.jpg'),
  types.User(
      id: 'Jean Sibelius',
      lastName: 'ジャン・シベリウス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Jean_Sibelius%2C_1913.jpg/220px-Jean_Sibelius%2C_1913.jpg'),
  types.User(
      id: "Jeanne d'Arc (Cypripedium janum d'Arc)",
      lastName: 'ジャンヌ・ダルク',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Joan_of_Arc_miniature_graded.jpg/250px-Joan_of_Arc_miniature_graded.jpg'),
  types.User(
      id: 'Charles VII (King of France)',
      lastName: 'シャルル7世 (フランス王)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/KarlVII.jpg/200px-KarlVII.jpg'),
  types.User(
      id: 'Louis XIV (King of France)',
      lastName: 'ルイ14世 (フランス王)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Louis_XIV_of_France.jpg/200px-Louis_XIV_of_France.jpg'),
  types.User(
      id: 'Marie Antoinette.',
      lastName: 'マリー・アントワネット',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Vig%C3%A9e-Lebrun_Marie_Antoinette_1783.jpg/200px-Vig%C3%A9e-Lebrun_Marie_Antoinette_1783.jpg'),
  types.User(
      id: 'Napoleon Bonaparte.',
      lastName: 'ナポレオン・ボナパルト',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Fran%C3%A7ois_G%C3%A9rard_-_Napoleon_I_001.JPG/200px-Fran%C3%A7ois_G%C3%A9rard_-_Napoleon_I_001.JPG'),
  types.User(
      id: 'Jean-Jacques Rousseau',
      lastName: 'ジャン＝ジャック・ルソー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Jean-Jacques_Rousseau_%28painted_portrait%29.jpg/200px-Jean-Jacques_Rousseau_%28painted_portrait%29.jpg'),
  types.User(
      id: 'Coco Chanel',
      lastName: 'ココ・シャネル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Coco_Chanel_in_Los_Angeles%2C_1931_%28cropped%29.jpg/180px-Coco_Chanel_in_Los_Angeles%2C_1931_%28cropped%29.jpg'),
  types.User(
      id: 'Claude Debussy',
      lastName: 'クロード・ドビュッシー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Claude_Debussy_ca_1908%2C_foto_av_F%C3%A9lix_Nadar.jpg/220px-Claude_Debussy_ca_1908%2C_foto_av_F%C3%A9lix_Nadar.jpg'),
  types.User(
      id: 'Georges Bizet',
      lastName: 'ジョルジュ・ビゼー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Georges_bizet.jpg/220px-Georges_bizet.jpg'),
  types.User(
      id: 'Ector Berlioz.',
      lastName: 'エクトル・ベルリオーズ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Hector_berlioz.jpg/220px-Hector_berlioz.jpg'),
  types.User(
      id: 'Jules Massenet',
      lastName: 'ジュール・マスネ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Jules_massenet.jpg/220px-Jules_massenet.jpg'),
  types.User(
      id: 'Eric Satie',
      lastName: 'エリック・サティ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Ericsatie.jpg/220px-Ericsatie.jpg'),
  types.User(
      id: 'Gabriel Foret',
      lastName: 'ガブリエル・フォーレ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Gabriel_Faur%C3%A9_Paul_Nadar_1905.JPG/220px-Gabriel_Faur%C3%A9_Paul_Nadar_1905.JPG'),
  types.User(
      id: 'Henri Bergson',
      lastName: 'アンリ・ベルクソン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Henri_Bergson.jpg/200px-Henri_Bergson.jpg'),
  types.User(
      id: 'Maximilian Robespierre',
      lastName: 'マクシミリアン・ロベスピエール',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Robespierre.jpg/400px-Robespierre.jpg'),
  types.User(
      id: 'Maurice Ravel',
      lastName: 'モーリス・ラヴェル',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Maurice_Ravel_1925.jpg/220px-Maurice_Ravel_1925.jpg'),
  types.User(
      id: 'Frederic Chopin',
      lastName: 'フレデリック・ショパン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Frederic_Chopin_photo.jpeg/200px-Frederic_Chopin_photo.jpeg'),
  types.User(
      id: 'Tekla Badajewska',
      lastName: 'テクラ・バダジェフスカ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/B%C4%85darzewska_Gebet_einer_Jungfrau.jpg/440px-B%C4%85darzewska_Gebet_einer_Jungfrau.jpg'),
  types.User(
      id: 'Prince Enrique Voyage',
      lastName: 'エンリケ航海王子',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Henry_the_Navigator1.jpg/200px-Henry_the_Navigator1.jpg'),
  types.User(
      id: 'Friedrich II (Holy Roman Emperor)',
      lastName: 'フリードリヒ2世 (神聖ローマ皇帝)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Frederick_II_and_eagle.jpg/200px-Frederick_II_and_eagle.jpg'),
  types.User(
      id: 'Mother Teresa',
      lastName: 'マザー・テレサ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/MotherTeresa_090.jpg/200px-MotherTeresa_090.jpg'),
  types.User(
      id: 'Fyodor Dostoevsky.',
      lastName: 'フョードル・ドストエフスキー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Dostoevsky.jpg/200px-Dostoevsky.jpg'),
  types.User(
      id: 'Lev Tolstoy.',
      lastName: 'レフ・トルストイ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/LNTolstoy.jpg/200px-LNTolstoy.jpg'),
  types.User(
      id: 'Yekaterina II (Tsar of Russia)',
      lastName: 'エカチェリーナ2世 (ロシア皇帝)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Catherine_II_by_J.B.Lampi_%281780s%2C_Kunsthistorisches_Museum%29.jpg/200px-Catherine_II_by_J.B.Lampi_%281780s%2C_Kunsthistorisches_Museum%29.jpg'),
  types.User(
      id: 'Ivan IV',
      lastName: 'イヴァン4世',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Ivan_grozny_frame.jpg/200px-Ivan_grozny_frame.jpg'),
  types.User(
      id: 'Peter I (Tsar of Russia)',
      lastName: 'ピョートル1世 (ロシア皇帝)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Peter_der-Grosse_1838.jpg/250px-Peter_der-Grosse_1838.jpg'),
  types.User(
      id: 'Pyotr Tchaikovsky',
      lastName: 'ピョートル・チャイコフスキー',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Tchaikowsky.jpg/200px-Tchaikowsky.jpg'),
  types.User(
      id: 'Karl the Great',
      lastName: 'カール大帝',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/D%C3%BCrer_karl_der_grosse.jpg/200px-D%C3%BCrer_karl_der_grosse.jpg'),
  types.User(
      id: 'Friedrich II (King of Prussia)',
      lastName: 'フリードリヒ2世 (プロイセン王)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Friedrich2_jung.jpg/200px-Friedrich2_jung.jpg'),
  types.User(
      id: 'Heinrich IV (Holy Roman Emperor)',
      lastName: 'ハインリヒ4世 (神聖ローマ皇帝)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Heinrich_4_g.jpg/225px-Heinrich_4_g.jpg'),
  types.User(
      id: 'Innocentius III (Pope)',
      lastName: 'インノケンティウス3世 (ローマ教皇)',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Innozenz3.jpg/150px-Innozenz3.jpg'),
  types.User(
      id: 'Augustus',
      lastName: 'アウグストゥス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Statue-Augustus.jpg/200px-Statue-Augustus.jpg'),
  types.User(
      id: 'Claudius Ptolemy.',
      lastName: 'クラウディオス・プトレマイオス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/PSM_V78_D326_Ptolemy.png/220px-PSM_V78_D326_Ptolemy.png'),
  types.User(
      id: 'Socrates',
      lastName: 'ソクラテス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Socrate_du_Louvre.jpg/200px-Socrate_du_Louvre.jpg'),
  types.User(
      id: 'Plato',
      lastName: 'プラトン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Plato.png/200px-Plato.png'),
  types.User(
      id: 'Eratosthenes',
      lastName: 'エラトステネス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Eratosthenes.jpg/200px-Eratosthenes.jpg'),
  types.User(
      id: 'Pericles (star in the constellation Pericles)',
      lastName: 'ペリクレス',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Pericles_Pio-Clementino_Inv269_n2.jpg/200px-Pericles_Pio-Clementino_Inv269_n2.jpg'),
  types.User(
      id: 'acquenaten',
      lastName: 'アクエンアテン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/GD-EG-Caire-Mus%C3%A9e061.JPG/220px-GD-EG-Caire-Mus%C3%A9e061.JPG'),
  types.User(
      id: 'Tutankamen',
      lastName: 'ツタンカーメン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Tutanchamun_Maske.jpg/220px-Tutanchamun_Maske.jpg'),
  types.User(
      id: 'David',
      lastName: 'ダビデ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/David_SM_Maggiore.jpg/200px-David_SM_Maggiore.jpg'),
  types.User(
      id: 'hammurabi',
      lastName: 'ハンムラビ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Milkau_Oberer_Teil_der_Stele_mit_dem_Text_von_Hammurapis_Gesetzescode_369-2.jpg/200px-Milkau_Oberer_Teil_der_Stele_mit_dem_Text_von_Hammurapis_Gesetzescode_369-2.jpg'),
  types.User(
      id: 'Shah Jahan.',
      lastName: 'シャー・ジャハーン',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Shah_Jahan_of_Mughal_empire.jpg/200px-Shah_Jahan_of_Mughal_empire.jpg'),
  types.User(
      id: 'Cleopatra VII',
      lastName: 'クレオパトラ7世',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Kleopatra-VII.-Altes-Museum-Berlin1.jpg/220px-Kleopatra-VII.-Altes-Museum-Berlin1.jpg'),
  types.User(
      id: 'Zhang Fei (Chinese deity said to be able to cure all ills)',
      lastName: '張飛',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/ZhangFei.jpg/180px-ZhangFei.jpg'),
  types.User(
      id: 'Zhao Yun',
      lastName: '趙雲',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/ZhaoYun.jpg/200px-ZhaoYun.jpg'),
  types.User(
      id: 'seven mansions (Chinese constellations) of the eastern heavens',
      lastName: '玄宗',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Disambig_gray.svg/30px-Disambig_gray.svg.png'),
  types.User(
      id: 'HanXin era (1177.8.4-1181.7.14)',
      lastName: '韓信',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/H%C3%A1n_X%C3%ACn.jpg/200px-H%C3%A1n_X%C3%ACn.jpg'),
  types.User(
      id: 'emperor Koumu (third highest of the eight hereditary titles)',
      lastName: '光武帝',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Han_Guangwu_Di.jpg/200px-Han_Guangwu_Di.jpg'),
  types.User(
      id: 'group of 3rd-century Qingtan scholars, writers, and musicians',
      lastName: '項羽',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Xiang_Yu.jpg/220px-Xiang_Yu.jpg'),
  types.User(
      id: 'Liu Bang',
      lastName: '劉邦',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Hangaozu.jpg/170px-Hangaozu.jpg'),
  types.User(
      id: 'dreary',
      lastName: '蕭何',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Xiao_he.jpg/200px-Xiao_he.jpg'),
  types.User(
      id: 'scarlet kadsura (Kadsura japonica)',
      lastName: '諸葛亮',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/%E8%9C%80%E6%B1%89%E4%B8%9E%E7%9B%B8%E5%BF%A0%E6%AD%A6%E4%BE%AF%E8%AF%B8%E8%91%9B%E4%BA%AE.jpg/220px-%E8%9C%80%E6%B1%89%E4%B8%9E%E7%9B%B8%E5%BF%A0%E6%AD%A6%E4%BE%AF%E8%AF%B8%E8%91%9B%E4%BA%AE.jpg'),
  types.User(
      id: 'Queen Mother of Goddess of Mercy',
      lastName: '則天武后',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/%E6%AD%A6%E5%88%99%E5%A4%A9%E7%94%BB%E5%83%8F.jpg/170px-%E6%AD%A6%E5%88%99%E5%A4%A9%E7%94%BB%E5%83%8F.jpg'),
  types.User(
      id: "Sukhavati (Amitabha's Pure Land)",
      lastName: '煬帝',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Sui_Yangdi_Tang.jpg/170px-Sui_Yangdi_Tang.jpg'),
  types.User(
      id: 'Yang Kuei Queen',
      lastName: '楊貴妃',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/%E4%B8%8A%E9%A9%AC%E5%9B%BE.jpg/200px-%E4%B8%8A%E9%A9%AC%E5%9B%BE.jpg'),
  types.User(
      id: 'Puyi (Chinese puppet theatre)',
      lastName: '溥儀',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Xuantong.jpg/300px-Xuantong.jpg'),
  types.User(
      id: 'Otto von Bismarck.',
      lastName: 'オットー・フォン・ビスマルク',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Bundesarchiv_Bild_146-2005-0057%2C_Otto_von_Bismarck.jpg/400px-Bundesarchiv_Bild_146-2005-0057%2C_Otto_von_Bismarck.jpg'),
];
