class Designer < ApplicationRecord
    has_many :products, dependent: :delete_all
end
