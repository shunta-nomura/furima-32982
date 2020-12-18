class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_PASS =  /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  VALID_KANZI =  /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  VALID_KATAKANA = /\p{Katakana}/
  validates :password, format: { with: VALID_PASS }
  validates :first_name, presence: true, format: { with: VALID_KANZI }
  validates :last_name, presence: true, format: { with: VALID_KANZI }
  validates :kana_first_name, presence: true, format: { with: VALID_KATAKANA }
  validates :kana_last_name, presence: true, format: { with: VALID_KATAKANA }
  validates :birthday, presence: true
end
