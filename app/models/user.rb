class User < ApplicationRecord
  has_secure_password
  has_many :products
  validates :username, :password, presence: true
  validates_uniqueness_of  :username
  has_many :orders
  has_many :products_orders
  has_many :products, through: :products_orders
end
