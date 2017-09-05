require 'csv'
require 'kconv'
class CarddataController < ApplicationController
  
  
  def import_csv ()
    csv_file = 
    csv_text = csv_file.read
    data = []
    
    #文字列をUTF-8に変換
    CSV.parse(Kconv.toutf8(csv_text)) do |row|
      cd = Carddata.new
      p row[0]
      p row[1]
      p row[2]
      # user.name    = row[0]  #csvの1列目を格納
      # user.kana    = row[1]  #csvの2列目を格納
      # user.address = row[2]  #csvの3列目を格納
      # user.tel     = row[3]  #csvの4列目を格納
      
      # user.save
    end
  
  end
end

# 参照: http://ayaketan.hatenablog.com/entry/2014/01/26/180141
