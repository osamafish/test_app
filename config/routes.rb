Rails.application.routes.draw do
  resources :users
  #resources :articales
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #   root 'application#hello'

  
  root 'pages#home'

  get 'about', to: 'pages#about' 
  resources :myarticles, only:[:show, :index, :new, :create, :edit, :update, :destroy] #same as "resources :articales" as it already enable *all

  get 'signup', to: 'myusers#new'
  resources :myusers   #, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]

end
