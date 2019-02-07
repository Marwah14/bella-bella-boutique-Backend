class Product < ApplicationRecord
  belongs_to :type
  belongs_to :designer
  has_many :carts, dependent: :delete_all 
  has_many :users, through: :carts
end
