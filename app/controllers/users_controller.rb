class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  
  def show
    @user = User.find (params[:id])
  end

  def new
    # @user = User.new
    # makejson("200",["createUser","uid"],["","381"])
    
    # ログインを求める
    createTest()
  end
  
  def create
    uid = 0;
    
    # 9桁のユーザーIDを生成
    100.times do
       uid = Random.rand(100000000 .. 999999999)
       unless User.exists?(uid: uid)
         break;
       end
    end
    
    @user = User.new(name: params[:name], password: params[:password],uid: uid,coin:0,dia: 0,loginDays: 1,rate: 0);
    
    if @user.save!
      loginjson()
      
      # makejson("200",["type","name","uid","coin","dia","loginDays","rate"],["createUser",@user.name,@user.uid,@user.coin,@user.dia,@user.loginDays,@user.rate])
    else
      makejson("500",["type"],["createUser"])
    end
    
    
    binding.pry
    # ログイン状態保持
    session[:user_id] = @user.id
    
    # 初回データ作成
    startdata
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:uid,:coin,:dia,:rate,:password,:password_digest,:loginDays,:modelchange)
  end
end
