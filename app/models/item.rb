class Item < ApplicationRecord
  belongs_to :users
  has_one :addresses
  validates :item_name, presence: true
  belongs_to :retailer
end
