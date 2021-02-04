class Seller < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, confirmation: true
    validates :password, presence: true, length: {minimum: 6}

    has_one :cart, dependent: :destroy
    has_many :orders
   accepts_nested_attributes_for :cart, allow_destroy: true  
end
