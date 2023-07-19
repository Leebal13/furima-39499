class PurchaseAddress
  include ActiveModel::Model
  # attr_accessor :postal_code, :region_id, :prefecture, :address_no, :building_no, :phone_number, :item_id,:user_id
  attr_accessor :postal_code, :region_id, :city, :address_no, :building_no, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は「3桁ハイフン4桁」の半角文字列で入力してください' }
    validates :city
    validates :address_no
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数値で入力してください' }
    validates :item_id
    validates :user_id
    validates :token
  end
  validates :region_id, numericality: {other_than: 0, message: 'を選択してください'}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code,
      region_id: region_id,
      purchase_id: purchase.id,
      city: city,
      address_no: address_no,
      phone_number: phone_number,
      building_no: building_no
    )
  end
end
