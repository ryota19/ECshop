Rails.application.routes.draw do

  get 'products/index'
  get 'products/new'

  get 'sessions/new'

  namespace :admin do
    resources :sellers
  end

  root to: 'products#index'

  get '/signup',    to: 'admin/sellers#new'
  post '/signup',   to: 'admin/sellers#create'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :products
  resources :carts
  resources :cart_items
  resources :orders do 
    patch :chenge_status
    post :confirm
  end
  resources :order_products do 
    patch :chenge_status
  end

  get '/confirm' => 'orders#confirm'
  post '/confirm' => 'orders#confirm'


  patch '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/destroy' => 'carts#delete_item'

  



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
