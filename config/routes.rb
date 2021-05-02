Rails.application.routes.draw do
  root 'menu#index'
  devise_for :users, controllers: { registrations: 'client_registrations', passwords: 'passwords' }
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  resources :phone_verifications, only: %i[new create] do |p|
    collection do
      get 'challenge'
      post 'verify'
      get 'success'
    end
  end
  resources :after_signup
  resources :user, only: %i[edit update]
  get 'user/profile'
end
