class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.integer :order
      t.timestamps
      
      t.index [:user_id,:order],unique: true
    end
  end
end
