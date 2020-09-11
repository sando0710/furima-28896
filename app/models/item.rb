class Item < ApplicationRecord


  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :deliveryBurden
  belongs_to_active_hash :prepareDay
  belongs_to_active_hash :prefecture
  validates :image, :name, :messages, :category_id, :condition_id, :shopping_cost_id, :prefecture_id, :send_day_id, :price, presence: true
  validates :category_id, :condition_id, :shopping_cost_id, :prefecture_id, :send_day_id, numericality: { other_than: 0 }
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width numbers' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  has_one :exchange
  
end
