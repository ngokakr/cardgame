class ShopsController < ApplicationController
  
  def shop_params
    params.require(:shop).permit(:content)
  end
  
  # カード購入
  def getcard  #pack=購入パック kind=購入通貨 count=購入数
  
    # pack = params[:pack]
    kind = params[:kind]
    count = params[:count].to_i #intにしている
    basepoint = 300
    cardsinpack = 6
    usepoint = basepoint * count * -1
    # if usepoint <= current_user.
    
    # ポイントを増減し、falseだったら中止
    unless changepoint(kind,usepoint)
      return
    end
    
    # レア度ごとに配列でidをまとめる
    rea3 = Carddata.where(rea: 3).pluck(:cid)
    rea2 = Carddata.where(rea: 2).pluck(:cid)
    rea1 = Carddata.where(rea: 1).pluck(:cid)
    rea0 = Carddata.where(rea: 0).pluck(:cid)
    
    # id決定
    result = []
    rate3 = 20
    rate2 = 60
    rate1 = 300
    
    count*cardsinpack.times do
      r = rand(1000) 
      # レア度3
      if r < rate3
        result.push(rea3.sample)
        next
      end
      
      # レア度2
      if r < rate2
        result.push(rea2.sample)
        next
      end
      
      # レア度1
      if r < rate1
        result.push(rea1.sample)
        next
      end
      
      # レア度0
      result.push(rea0.sample)
      
    end
    
    # 表示
    p result
    
    # カード追加
    addboxcards(result,1)
    
    
    render :json => loginjson()
    # # トランザクション
    # ActiveRecord::Base.transaction do
    #   @card.save!
    #   current_user.save!
    # end
  end
  
  
end
