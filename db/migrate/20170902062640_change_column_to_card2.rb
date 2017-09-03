class ChangeColumnToCard2 < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:cards,  :count, 0)
  end
end
