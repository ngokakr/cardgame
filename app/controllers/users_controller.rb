class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  
  # 初回登録
  def create
    uid = 0;
    
    # 9桁のユーザーIDを生成
    100.times do
       uid = Random.rand(100000000 .. 999999999)
       unless User.exists?(uid: uid)
         break;
       end
    end
    
    # 所持金
    @user = User.new(name: params[:name], password: params[:password],uid: uid,coin:1000,dia: 1000,loginDays: 1,rate: 0);
    
    # ユーザー保存
    @user.save!
      
    # ログイン状態保持
    session[:user_id] = @user.id
    
    # カード追加
    addboxcards([8,14,58,21,66,6,80,77,79,78,185],1)
    
    # ログイン結果を送信
    render :json => loginjson()
  end
  
  def test
    p "ooo"
  end
  
  def show
    @user = User.find (params[:id])
  end

  def new
    # @user = User.new
    # makejson("200",["createUser","uid"],["","381"])
    
    # ログインを求める
    createTest()
  end
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:name,:uid,:coin,:dia,:rate,:password,:password_digest,:loginDays,:modelchange)
  end
end
