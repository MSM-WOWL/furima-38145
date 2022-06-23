class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email, presence: true
         validates :nickname, presence: true
         validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
         validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
         validates :last_kana_name, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
         validates :first_kana_name, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
         validates :birth_day, presence: true
end
