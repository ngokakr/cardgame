class CardsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  
  # ショップ等
  
  def create
    
    @card = current_user.cards.build(card_params)
    
    
  end
  
  # shop = ショップ番号 , use = coin/dia/ticket , count = 購入数
  def card_params
    params.require(:card).permit(:cid,:use,:count)
  end
  
  
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
  end
  
end
