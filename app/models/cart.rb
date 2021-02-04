class Cart < ApplicationRecord
    belongs_to :seller
    has_many :cart_items

end
