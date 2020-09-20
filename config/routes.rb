Rails.application.routes.draw do
  devise_for :books
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books
  resources :users

# Rails.application.routes.draw do
  root 'home#index'
# end
end
