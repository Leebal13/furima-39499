class Shipping < ApplicationRecord
  belongs_to :items
  belongs_to :users
  belongs_to :purchases
  validates :postal_code, presence: true
  validates :region, presence: true
  validates :prefecture, presence: true
  validates :address_no, presence: true
  validates :phone_number, presence: true
end
