Rails.application.routes.draw do
  #resources :articales
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #   root 'application#hello'

  
  root 'pages#home'
  get 'about', to: 'pages#about' 
  resources :myarticles, only:[:show, :index, :new, :create, :edit, :update, :destroy]


end
