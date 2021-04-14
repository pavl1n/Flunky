Rails.application.routes.draw do
  root 'menu#index'
  get 'users/profile'
  devise_for :users
  root 'main_page#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
