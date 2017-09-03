class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :cid
      t.integer :lv
      t.integer :count

      t.timestamps
    end
  end
end
