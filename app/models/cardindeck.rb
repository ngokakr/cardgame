class Cardindeck < ApplicationRecord
  belongs_to :deck
  belongs_to :card
  
  validates :deck_id, presence: true
  validates :card_id, presence: true
  
end
