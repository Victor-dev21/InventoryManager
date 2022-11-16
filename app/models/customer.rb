class Customer < ApplicationRecord
  has_secure_password
  validates :username, :password, presence: true
  validates_uniqueness_of  :username
  has_many :customer_products
  has_many :products, through: :customer_products
end
