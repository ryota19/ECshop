Seller.find_or_create_by!(email: 'admin@example.com') do |seller|
    seller.name = 'admin'
    seller.admin = true
    seller.password = 'password'
    seller.password_confirmation = 'password'
end
