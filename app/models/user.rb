class User < ApplicationRecord
  has_many :purchases
  has_many :items
  has_one :addresses
  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true
  validates :password, presence: true
  validates :name, presence: true
  validates :kana_name, presence: true
  validates :birthdate, presence: true
end
