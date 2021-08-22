class SpicyLevel < ActiveHash::Base
  self.data = [
    { id: 0, name:"--"},
    { id: 1, name:"1辛"},
    { id: 2, name:"2辛"},
    { id: 3, name:"3辛"},
    { id: 4, name:"4辛"},
    { id: 5, name:"5辛"},
    { id: 6, name:"6辛"},
    { id: 7, name:"7辛"},
    { id: 8, name:"8辛"},
    { id: 9, name:"9辛"},
    { id: 10, name:"10辛"},
    { id: 11, name:"11辛"},
    { id: 12, name:"0辛"}
  ]

  include ActiveHash::Associations
  has_many :foods

end