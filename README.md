# アプリケーション名  「KARAI」

![karai-toppege.jpeg](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/1768158/d9d4028b-d7d6-00b4-0f07-3186bb054869.jpeg)


## アプリケーション概要
辛い食べ物を共有するアプリケーション

![f5e8f4d7317ac91c013356092c325097.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/1768158/c6a739a0-ff5f-5c43-e28c-940c0736ee02.gif)

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

## foods テーブル

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

## likes テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key:true  |
| food          | references | null: false, foreign_key:true  |

### Association

- belongs_to :user
- belongs_to :food

## relationships テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| following    | references | null: false, foreign_key: true |
| follower     | references | null: false, foreign_key: true |

### Association

- belongs_to :following ,class_name: "User"
- belongs_to :follower, class_name: "User"

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| food         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :food