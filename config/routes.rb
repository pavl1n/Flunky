Rails.application.routes.draw do
  root 'menu#index'
  namespace :api do
    namespace :v1 do
      resources :products
      resources :user
    end
  end

  get '*path', to: 'pages#index', via: :all
  resources :order_positions
  resources :admins do
    collection do
      put :update
    end
  end
  resources :requests
  get 'cart', to: 'cart#show'
  post 'cart/approve', to: 'cart#approve'
  devise_for :users, controllers: { registrations: 'client_registrations', omniauth_callbacks: 'users/omniauth_callbacks', passwords: 'passwords', sessions: 'sessions' }, class_name: 'User'
  devise_for :restaurants,
    class_name: 'User',
    only: [],
    controllers: { registrations: 'restaurants' }

  devise_scope :restaurant do
    get   "/restaurants/new", to: "restaurants#new", as: :new_restaurant
    post  "/restaurants",    to: "restaurants#create", as: :restaurants
    get  "/restaurants/destroy",    to: "restaurants#destroy", as: :destroy_restaurant_session
  end

  resources :restaurant, only: %i[index show destroy] do
    get :products
  end
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  match '/403', to: 'errors#not_authorized', via: :all
  resources :phone_verifications, only: %i[new create] do
    collection do
      get 'challenge'
      post 'verify'
      get 'success'
    end
  end
  resources :after_signup
  resources :restaurant_orders, only: %i[index] do
    collection do
      post :update
    end
  end
  get '/search', to: 'pages#search', as: 'search_page'
  resources :restaurant_steps
  resources :user do
    resources :products do
      resources :comments, only: %i[create destroy]
    end
    resources :orders, only: %i[index]
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
  mount ActionCable.server => '/cable'
end
