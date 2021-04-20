Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  #resources :books #gives all routes for books 
  resources :books, only: [:show, :index, :new, :create]
end