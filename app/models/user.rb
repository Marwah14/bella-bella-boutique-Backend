class User < ApplicationRecord
    has_many :carts, dependent: :delete_all
    has_many :products, through: :carts
    has_secure_token :auth_token
    has_secure_password

    before_validation :downcase_email

    validates :name, :email, :password, presence: true 
    validates :email, uniqueness: true 
    validates :password, length: { minimum: 2 }

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
