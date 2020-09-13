class ExchangeS

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :post_code, :prefecture, :city, :address, :building, :phone_number
    validates :token
  end
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
  validates :phone_number, format: { with: /\A\d{11}\z/ }

end