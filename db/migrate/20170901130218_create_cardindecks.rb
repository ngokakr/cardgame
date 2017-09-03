class CreateCardindecks < ActiveRecord::Migration[5.0]
  def change
    create_table :cardindecks do |t|
      t.references :deck, foreign_key: true
      t.references :card, foreign_key: true
      t.integer :count

      t.timestamps
      t.index [:deck_id,:card_id],unique: true
    end
  end
end
