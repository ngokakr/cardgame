class Deck < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  
  has_many :cardindecks,class_name: "Cardindeck"
  has_many :in,through: :cardindecks,source: :card
end
