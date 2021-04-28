Rails.application.routes.draw do
  root 'menu#index'
  devise_for :users, controllers: { registrations: 'client_registrations' }

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
  get 'user_registration/profile'
  get 'user_registration/password_change'
  get 'user_registration/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
