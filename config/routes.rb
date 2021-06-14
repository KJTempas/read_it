Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :books #gives all routes for books 
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy' #changed from delete to get per https://stackoverflow.com/questions/23368994/no-route-matches-get-logout-rails because could not log out user
  resources :categories, except: [:destroy]
end
