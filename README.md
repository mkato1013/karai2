# アプリケーション名  「KARAI」

![karai-toppege](https://user-images.githubusercontent.com/87405282/132785018-9b29e819-963b-4e5f-9d72-b3c125d46a9f.jpeg)

## アプリケーション概要
辛い食べ物を共有するアプリケーション

![karaimovie](https://user-images.githubusercontent.com/87405282/132784762-16f52189-1448-44b5-a8d6-00ea7e30a404.gif)

## App URL
https://karai-app.herokuapp.com/

### ペルソナ
- `辛いもの好き`で、なかなか辛い食べ物を探すことができない方
- `サクッと`辛いものを`食べたい`社会人
- 辛いもの好きな主婦や主夫（`おうちのご飯`の共有）
- 自炊で辛い食べ物ができた時の`レシピメモ`をしたい方

# 作者
- [Qiita](https://qiita.com/mkato1013)
- [Twitter](https://twitter.com/progmkatogorp)
- [Github](https://github.com/mkato1013)

# テーブル設計

## users テーブル
ユーザーを登録した際には、以下の`ユーザー設定・編集`ができます。
- メールアドレス
- 一言コメント
- アイコン

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| introduction       | text    |                           |

### Association

- has_many :foods
- has_many :likes
- has_many :relationships, foreign_key: :following_id
- has_many :followings, through: :relationships, source: :follower
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id
- has_many :followers, through: :reverse_of_relationships, source: :following
- has_one_attached :icon

![karai-user](https://user-images.githubusercontent.com/87405282/132786925-4b617635-f0d8-4ea3-98b6-406b5604664b.gif)

## foods テーブル
辛い食べ物を投稿する際の`項目`（必須・任意）は以下の通りです。
- カテゴリー（ラーメン、カレー、韓国料理、おうちごはん、など）
- 店名
- 店名（読み方）
- メニュー名
- 辛さ採点
- 最寄り駅
- 待ち時間
- 投稿する食べ物に関するコメント

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| meal_type_id    | integer    |                              |
| shop_name       | string     | null: false                  |
| shop_name_kana  | string     |                              |
| food_name       | string     | null: false                  |
| spicy_level_id  | integer    | null: false                  |
| station         | string     |                              |
| shop_mood_id    | integer    |                              |
| waiting_time_id | integer    |                              |
| food_comment    | text       |                              |
| user            | references | null:false, foreign_key:true |

### Association

- belongs_to :user
- has_many :likes
- has_many :liked_users, through: :likes, source: :user, dependent: :destroy
- has_one_attached :image
- has_many :comments, dependent: :destroy

![karai-food](https://user-images.githubusercontent.com/87405282/132786626-b98443a2-5b2f-45c6-8cfd-625dc663251a.gif)

## likes テーブル
ログインしたユーザーは、投稿に対して`いいね（KALIKE）`できます。

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key:true  |
| food          | references | null: false, foreign_key:true  |

### Association

- belongs_to :user
- belongs_to :food

![karai-like](https://user-images.githubusercontent.com/87405282/132785508-2195b5a9-2e64-4c2a-871b-f51f80b3536e.gif)

## relationships テーブル
ログインしたユーザーは、辛い食べ物をより見つけやすいよう、`フォロー`できる機能を実装しています。

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| following    | references | null: false, foreign_key: true |
| follower     | references | null: false, foreign_key: true |

### Association

- belongs_to :following ,class_name: "User"
- belongs_to :follower, class_name: "User"

![karai-follow](https://user-images.githubusercontent.com/87405282/132785762-b52e7e54-82e6-45c4-965c-ebf4f8cc1ebb.gif)

## comments テーブル
ログインしたユーザーは、投稿した食べ物の`コメントを投稿・閲覧`することができます。

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| food         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :food

![karai-comment](https://user-images.githubusercontent.com/87405282/132867741-879dc084-140f-4483-bd58-c514f95f0c24.gif)
