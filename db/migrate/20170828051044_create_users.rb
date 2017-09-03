class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :uid
      t.integer :coin
      t.integer :dia
      t.integer :rate
      t.string :password_digest
      t.integer :loginDays
      t.string :modelchange

      t.timestamps
    end
  end
end
