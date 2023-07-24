class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :detail_category
  belongs_to :detail_condition
  belongs_to :delivery_format
  belongs_to :region
  belongs_to :arrival


  validates :item_name, presence: true
  validates :description, presence: true
  validates :detail_category_id, presence: true, numericality: { other_than: 1, message: "空ではできない" }
  validates :detail_condition_id, presence: true, numericality: { other_than: 1 , message: "空ではできない"}
  validates :delivery_format_id, presence: true, numericality: { other_than: 1 , message: "空ではできない" }
  validates :region_id, presence: true, numericality: { other_than: 1 , message: "空ではできない" }
  validates :arrival_id, presence: true, numericality: { other_than: 1 , message: "空ではできない" }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validate :valid_half_width_numerical_characters
  validates :image, presence: true
  # validates :text, image, presence:true

  private

  def valid_half_width_numerical_characters
    return if price.blank? || price.to_s =~ /\A\d+\z/

    errors.add(:price, "should only allow half-width numerical characters")
  end



end
