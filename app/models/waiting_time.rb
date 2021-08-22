class WaitingTime < ActiveHash::Base
  self.data = [
    { id: 0, name:"--"},
    { id: 1, name:"待ち無し"},
    { id: 2, name:"整理券"},
    { id: 3, name:"~5分"},
    { id: 4, name:"5~15分"},
    { id: 5, name:"15~30分"},
    { id: 6, name:"30分~1時間"},
    { id: 7, name:"1~2時間"},
    { id: 8, name:"2時間~"},
    { id: 9, name:"予約"}
  ]

  include ActiveHash::Associations
  has_many :foods

end