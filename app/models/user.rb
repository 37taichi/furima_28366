class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  namae = /\A[ぁ-んァ-ン一-龥]+\z/
  kana = /\A[ァ-ン]+\z/

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :encrypted_password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  validates :first_name, presence: true, format: { with: namae }
  validates :family_name, presence: true, format: { with: namae }
  validates :first_name_kana, presence: true, format: { with: kana }
  validates :family_name_kana, presence: true, format: { with: kana }
  validates :birthday, presence: true

end
