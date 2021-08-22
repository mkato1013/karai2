class ShopMood < ActiveHash::Base
  self.data = [
    { id: 0, name:"--"},
    { id: 1, name:"とても良い"},
    { id: 2, name:"良い"},
    { id: 3, name:"普通"},
    { id: 4, name:"良くない"},
    { id: 5, name:"自分には合わなかった"}
  ]

  include ActiveHash::Associations
  has_many :foods

end