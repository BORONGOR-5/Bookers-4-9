Rails.application.routes.draw do

  devise_for :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books
  resources :users
  resources :homes
  # , only
  
  post 'books_path' => 'books#create'
  
  post '/users/#{@user.id}/update' => 'users#update'
  
# Rails.application.routes.draw do
  root 'home#index'
# end
end
