Rails.application.routes.draw do
  root to: "users#new"
  
  # 登録
  resources :users,only: [:show,:create]
  
  # ログイン用
  post "login", to: "sessions#create"
  
  # カード購入 (kind=購入通貨 count=購入数)
  post "shop",to:"shops#getcard"
  
  # テスト用
  post "test",to: "users#test"
  
  
  
end
