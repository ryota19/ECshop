class Product < ApplicationRecord
    validates :name, presence: true
    validates :price, presence:true

    mount_uploader :image, ImageUploader

    has_many :cart_items

end
