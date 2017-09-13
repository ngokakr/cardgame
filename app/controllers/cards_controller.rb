class CardsController < ApplicationController
  before_action :require_user_logged_in , only: [:lvup]
  before_action :correct_user, only: [:destroy]
  
  
  # ショップ等
  def create
    @card = current_user.cards.build(card_params)
  end
  
  # shop = ショップ番号 , use = coin/dia/ticket , count = 購入数
  def card_params
    params.require(:card).permit(:cid,:use,:count)
  end
  
  # カードレベルアップ
  def lvup()
    cid = params[:cid].to_i;
    to_lv = params[:to_lv].to_i;
   
    @card = current_user.cards.find_by(cid: cid)
    cardcount = @card.count
    cd= Carddata.find_by(cid: cid)
    reality = cd.rea;
    
    needcount = NeedCards[@card.lv-1];
     # 存在するか & 指定したレベルか & 最大レベルでない & 枚数が足りている
    if @card && @card.lv+1 == to_lv && to_lv <= MaxLvs[reality] && cardcount >= needcount
      @card.lv += 1
      @card.count -= needcount;
      @card.save()
      render :json => lvupjson(cid,@card.lv.to_s)
      return
    else
      render :json => errorjson("lvup")
      return
    end
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
  end
  
  
  
end
