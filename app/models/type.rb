class Type < ApplicationRecord
  belongs_to :category
  has_many :products, dependent: :delete_all
end
