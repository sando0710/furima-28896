class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, presence: true,
                       format: { with: /\A[a-z\d]{6,100}+\z/i, message: ' Include both letters and numbers' }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :first_name, :last_name, presence: true,
                                     format: { with: /\A[一-龥ぁ-ん]/, message: 'Full-width characters' }
  validates :first_name_kana, :last_name_kana, presence: true,
                                               format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
  validates :birth_day, presence: true


  has_many :item
  has_many :exchange

end
