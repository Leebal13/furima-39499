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

  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角文字である必要があります" }
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角文字である必要があります" }
  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "全角カタカナでなければなりません" }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "全角カタカナでなければなりません" }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,message: "検証できない" }

  validates :birthdate, presence: true
end
