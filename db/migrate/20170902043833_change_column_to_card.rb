class ChangeColumnToCard < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:cards,  :lv, 1)
  end
end
