class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  namae = /\A[ぁ-んァ-ン一-龥]/
  kana = /\A[ァ-ン]+\z/

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: "a" }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX, message: "b" }
  
  with_options presence: true,format: { with: namae, message: "is invalid. Input full-width characters." } do
    validates :first_name
    validates :family_name
  end
  with_options presence: true,format: { with: kana, message: "is invalid. Input full-width kana characters." } do
    validates :first_name_kana
    validates :family_name_kana
  end
  validates :birthday, presence: true
end

