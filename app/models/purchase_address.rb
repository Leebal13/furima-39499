class PurchaseAddress
  include ActiveModel::Model
  # attr_accessor :postal_code, :region_id, :prefecture, :address_no, :building_no, :phone_number, :item_id,:user_id
  attr_accessor :postal_code, :region_id, :item_id, :user_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    # validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)" }
  end
  validates :region_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, region_id: region_id,purchase_id: purchase.id)
  end
end
