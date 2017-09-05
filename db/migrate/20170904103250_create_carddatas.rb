class CreateCarddatas < ActiveRecord::Migration[5.0]
  def change
    create_table :carddatas do |t|
      t.integer :cid
      t.integer :atr
      t.integer :rea
      t.string :name
      t.integer :cost
      t.integer :power

      t.timestamps
    end
  end
end
