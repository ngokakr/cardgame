class Card < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :cid, presence: true
  validates :lv,presence: true
  
  has_many  :cardindecks,class_name: "Cardindeck"
end
