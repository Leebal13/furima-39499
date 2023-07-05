class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :item_name, presence: true
  validates :description, presence: true
  validates :detail_category_id, presence: true
  validates :detail_condition_id, presence: true
  validates :delivery_format_id, presence: true
  validates :region_id, presence: true
  validates :arrival_id, presence: true
  validates :price, presence: true

  # Other model logic and methods...
end
