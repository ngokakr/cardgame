module ApplicationHelper
  include SessionsHelper
  
  class Deckdata
    attr_accessor :name, :data
    def initialize(name,data)
      self.name = name
      self.data = data
    end
  end
  
  class CardindeckData
    attr_accessor :d_id, :c_id,:count
    def initialize(d_id,c_id,count)
      self.d_id = d_id
      self.c_id = c_id
    end
  end
  
  MAX_CARD_IN_DECK = 30
  
  # 初期化処理
  def startdata
    # ActiveRecord::Base.transaction do
      # カード追加
      [1, 2, 3, 4, 5,6,7,8,9,10,11,12].each do |number|
        addboxcard(number,1)
      end
      
      # 空デッキ作成
      deck_id = newdeck("Default Deck").id #空デッキ
      
      # デッキにカード追加
      [1, 2, 3, 4, 5,6,7,8,9,10].each do |number|
        setdeckcard(deck_id,number,3)
      end
      
    # end
  end
  
  
  
  # デッキにカードをセットする
  def setdeckcard (deck_id,cid,count)
    # 4枚以上入れようとしていたら弾く
    if count > 3
      return
    end
    
    # デッキとカードの関係を取得する
    c =  current_user.cards.find_by(cid: cid);
    unless c #カードを所有していなければリターン
      return
    end
    cd =  current_user.cards.find_by(cid: cid).cardindecks.find_or_create_by(deck_id: deck_id) 
    
    # 0枚以下であれば削除
    if count <= 0
      cd.destroy
      return
    end
    
    # 枚数変更
    cd.count = count
    
    # 保存
    cd.save!
  end
  
  
  
  # カード購入
  # def shop(pack,kind,count) #pack=購入パック kind=購入通貨 count=購入数
  #   usepoint = 300
  #   cardsinpack = 6
  #   changepoint (kind,usepoint * count * -1)
  #   addboxcard(2,cardindecks * count)
    
  #   # トランザクション
  #   ActiveRecord::Base.transaction do
  #     @card.save!
  #     current_user.save!
  #   end
  # end
  
  # カードレベルアップ
  def lvup(cid,to_lv)
    # 存在するか -> 指定したレベルかチェック
    @card = current_user.cards.find_by(cid: cid)
    if @card
      if @card.lv+1 == to_lv
        @card.lv += 1
      end
    else
      return
    end 
  end
  
  # デッキ名変更
  def changedeckname (deck_id,name)
    @deck = current_user.decks.find(deck_id)
    @deck.name = name
  end
  
  # デッキ新規作成
  def newdeck (name)
    maxDecks = 30
    # 最大数を超えて新規作成はできない
    if current_user.decks.count < maxDecks
      # 名前だけ指定して作成
      return current_user.decks.create(name: name)
    else
      return
    end
  end
  
  # デッキ削除関数
  def deletedeck (deck_id)
    current_user.decks.find(deck_id).destroy
  end
  
  # 正しいデッキかどうか
  def correct_deck?(deck_id)
    d = current_user.decks.find(deck_id)
    
    # 30枚かどうか
    count = d.cardindecks.sum(:count)
    unless count == MAX_CARD_IN_DECK
      return false
    end
    
    # 3枚以上入れているカードが1種類でもあるか
    if 1 <= d.cardindecks.where("count > 3").count
      return false
    end
    
    # 正しいデッキである。
    return true
    
  end
  
end
