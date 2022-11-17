class Order < ApplicationRecord
  has_many :products_orders
  has_many :products, through: :products_orders
  belongs_to :customer
  belongs_to :user

end
