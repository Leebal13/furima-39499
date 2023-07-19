class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :purchases
  has_many :items

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :kana_first_name, presence: true
  validates :kana_last_name, presence: true

  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "must be full-width characters" }
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "must be full-width characters" }
  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "must be full-width katakana characters" }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "must be full-width katakana characters" }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,message: "must be valid" }

  validates :birthdate, presence: true
end
