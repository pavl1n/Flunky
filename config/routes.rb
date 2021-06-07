Rails.application.routes.draw do
  root 'menu#index'
  resources :order_positions
  get 'cart', to: 'cart#show'
  post 'cart/approve', to: 'cart#approve'
  devise_for :users, controllers: { registrations: 'client_registrations', omniauth_callbacks: 'users/omniauth_callbacks', passwords: 'passwords' }, class_name: 'User'
  devise_for :restaurants,
    class_name: 'User',
    only: [],
    controllers: { registrations: 'restaurants' }

  devise_scope :restaurant do
    get   "/restaurants/new", to: "restaurants#new", as: :new_restaurant
    post  "/restaurants",    to: "restaurants#create", as: :restaurants
    get  "/restaurants/destroy",    to: "restaurants#destroy", as: :destroy_restaurant_session
  end

  resources :restaurant, only: %i[show] do
    get :products
  end
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  resources :phone_verifications, only: %i[new create] do
    collection do
      get 'challenge'
      post 'verify'
      get 'success'
    end
  end
  resources :after_signup
  resources :restaurant_orders, only: %i[index]
  post 'restaurant_orders/approve', to: 'restaurant_orders#approve'
  post 'restaurant_orders/finish', to: 'restaurant_orders#finish'
  resources :restaurant_steps
  resources :user, only: %i[edit update] do
    resources :products do
      resources :comments
    end
    collection do
      get 'profile'
      get 'dishes'
    end
    member do
      get :edit_phone_number
      patch :update_phone_number
      put :update_phone_number
    end
  end
end
