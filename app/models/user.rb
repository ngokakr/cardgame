class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 12 }
  validates :uid,presence: true,length:{maximum:9}
  validates :coin,presence: true
  validates :dia,presence: true
  validates :rate,presence: true
  
  has_secure_password
  has_many :cards
  has_many :decks
  
  # def getcard (cardid,count)
    
  #   self.cards.find_or_create_by()
  #   User.cards.find_or_create_by(first_name: 'abc') do |user|
  #     user.last_name = '123'
  #   end
  # end
end
