Rails.application.routes.draw do

  devise_for :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books
  resources :users
  # resources :homes
  # , only

    # get 'about', to: 'homes#about'
  # get 'about' => 'homes#about'


  # resources :homes, only: [:show] do
  # collection do
  #   get :about
  # end
  # end

  root 'home#index'
  get 'home/about' => 'home#about'
  # resources :homes do
  # collection do
  #   get 'about'
  # end
  # end

  # post 'books_path' => 'books#create'

  # post '/users/#{@user.id}/update' => 'users#update'

# Rails.application.routes.draw do

# end
end
