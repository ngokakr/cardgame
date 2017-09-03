class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  include ApplicationHelper
  include SessionsHelper
  
  class PlayerData
    attr_accessor :uid, :coin, :dia,:rate,:loginDays
    def initialize(uid,coin,dia,rate,loginDays)
      self.uid = uid
      self.coin = coin
      self.dia = dia
      self.rate = rate
      self.loginDays = loginDays
    end
  end
  
  class LoginData
    attr_accessor :name,:uid,:coin,:dia,:loginDays,:rate
    def initialize(name,uid,coin,dia,loginDays,rate)
      self.name = name
      self.uid = uid
      self.coin = coin
      self.dia = dia
      self.loginDays = loginDays
      self.rate = rate
    end
  end
  
  class PresentData
    attr_accessor :id,:compen,:title,:detail,:kind,:point,:received,:startt,:endt
    def initialize(id,compen,title,detail,kind,point,received,startt,endt)
      self.id = id
      self.compen = compen
      self.title = title
      self.detail = detail
      self.kind = kind
      self.point = point
      self.received = received
      self.startt =startt
      self.endt = endt
    end
  end
  
  class FriendData
    attr_accessor :uid,:icon,:status,:name,:rate,:lastLogin
    def initialize(uid,icon,status,name,rate,lastLogin)
      self.uid = uid
      self.icon = icon
      self.status = status
      self.name = name
      self.rate = rate
      self.lastLogin = lastLogin
    end
  end
  
  def createTest
    pdata = PlayerData.new(123456789,100,101,1200,3)
    render :json => pdata.to_json
  end
  
  def makejson(code,kind,data)
    
    hash = {}
    kind.each_with_index do |var,i|
      hash[var] = data[i]
    end
    
    # require 'msgpack'
    
    msg = {}
    msg["meta"] = code
    msg["data"] = hash
    render :json => {"meta": {"code": code}, "data": hash.to_json}
    # render :text => MessagePack.pack(msg)
  end
  
  def loginjson ()
    makejson("200",["type","name","uid","coin","dia","loginDays","rate"],["login",@user.name,@user.uid,@user.coin,@user.dia,@user.loginDays,@user.rate])
  end
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
end
