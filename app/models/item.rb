class Item < ApplicationRecord
    # validates :name, presence: true
    # validates :introduction, presence: true

 belongs_to :user

 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to_active_hash :category
 belongs_to_active_hash :condition
 belongs_to_active_hash :deliveryBurden
 belongs_to_active_hash :prepareDay
 belongs_to_active_hash :prefecture
 

 has_one :exchange
#  has_one_attached :item_image
#  <%= image_tag user.avatar.variant(resize_to_fill: [308, 308]) %>  
end
