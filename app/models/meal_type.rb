class MealType < ActiveHash::Base
  self.data = [
    { id: 0, name:"--"},
    { id: 1, name:"ラーメン"},
    { id: 2, name:"カレー"},
    { id: 3, name:"韓国料理"},
    { id: 4, name:"インスタント"},
    { id: 5, name:"お菓子"},
    { id: 6, name:"飲み物"},
    { id: 7, name:"キムチ"},
    { id: 8, name:"その他"},
    { id: 9, name:"項目追加依頼はお問い合わせフォームへ"}
  ]

  include ActiveHash::Associations
  has_many :foods

end