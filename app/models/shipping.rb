class Shipping < ApplicationRecord
 # validates :name, presence: true
    # validates :introduction, presence: true

    belongs_to :exchange
    belongs_to_active_hash :prefecture
end
