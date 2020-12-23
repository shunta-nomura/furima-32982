class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASS = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i.freeze
  validates :password, format: { with: VALID_PASS }

  VALID_KANZI =  /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/.freeze
  VALID_KATAKANA = /\p{Katakana}/.freeze

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: VALID_KANZI } do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: VALID_KATAKANA } do
      validates :kana_first_name
      validates :kana_last_name
    end
  end

  has_many :items
  has_many :buys


end
