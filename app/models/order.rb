class Order
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalitie, :address, :building, :telephone, :user_id, :item_id, :token, :price

  # ここにバリデーションの処理を書く

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalitie, :address, :user_id, :item_id, :token
    validates :telephone, format: {with: /\A\d{10,11}\z/}

  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    # 各テーブルにデータを保存する処理を書く
    # 寄付情報を保存し、変数donationに代入する
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipalitie: municipalitie, address: address, building: building, telephone: telephone, purchase_record_id: purchase_record.id)
  end
end