class SessionsController < ApplicationController
  def create
    uid = params[:uid]
    password = params[:password]
    if login(uid, password)
      # makejson("200",["login","loginDays"],["",@user.loginDays.to_s])
      
      render :json => loginjson()
    else
      render :json => errorjson("login")
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private
  
  def login(uid,password)
    @user = User.find_by(uid: uid)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
  
end
