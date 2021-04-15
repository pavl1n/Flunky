Rails.application.routes.draw do
  root 'menu#index'
  devise_for :users, controllers: { registrations: 'client_registrations' }
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  resources :phone_verifications, only: [:new, :create] do |p|
    collection do
      get 'challenge'
      post 'verify'
      get 'success'
    end
  end
  resources :after_signup
  resources :users, only: [:index, :show, :edit, :update]
  get 'user_registration/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
