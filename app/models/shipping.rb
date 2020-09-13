class Shipping < ApplicationRecord


  belongs_to :exchange
  belongs_to_active_hash :prefecture
end
