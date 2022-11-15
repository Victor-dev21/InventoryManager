class User < ApplicationRecord
  has_secure_password
  has_many :products
  validates :username, :password, presence: true
  validates_uniqueness_of  :username

end
