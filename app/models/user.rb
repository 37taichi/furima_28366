class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :item_purchases

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  namae = /\A[ぁ-んァ-ン一-龥]/
  kana = /\A[ァ-ン]+\z/

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: 'is invalid' }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX, message: 'cannot be saved unless it is mixed alphanumeric' }

  with_options presence: true, format: { with: namae, message: 'is invalid. Input full-width characters.' } do
    validates :first_name
    validates :family_name
  end
  with_options presence: true, format: { with: kana, message: 'is invalid. Input full-width kana characters.' } do
    validates :first_name_kana
    validates :family_name_kana
  end
  validates :birthday, presence: true do
  end
end
