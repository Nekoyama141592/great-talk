lib/
  ├── core/
  │   ├── exception/
  │   ├── extension/
  │   ├── provider/
  │   └── util/
  ├── domain/
  │   ├── entity/ # アプリ共通のモデル, ドメインエンティティを定義
  │   ├── value/ # ドメインエンティティで使用するバリューオブジェクトを定義
  │   ├── repository/ # 外部リソースにアクセスするレポジトリのインターフェースを定義
  │   ├── use_case_interface/ # アプリケーションの機能に関するユースケースのインターフェースを定義
  │   └── factory/
  ├── application/
  │   └── usecase/
  ├── infrastructure/
  │   ├── datasource/
  │   ├── repository/
  │   └── factory/
  ├── presentation/
  │   ├── component/
  │   ├── page/
  │   ├── notifier/
  │   ├── state/
  │   └── navigation/
  └── main_dev.dart
  └── main_prod.dart