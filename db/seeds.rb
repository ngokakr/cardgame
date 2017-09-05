# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"


is_data = false
CSV.foreach('db/CardParam.csv') do |row|
  
  # 1ループ目無効
  if !is_data || row[7] == nil
    is_data = true
    next
  end
  # if is_data.blank?
  #   is_data = true
  #   next 
  # end
  
  Carddata.create(cid: row[0],atr: row[1],rea: row[3],name: row[7],cost: row[8],power: row[10])
  
end