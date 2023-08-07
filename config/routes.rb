Rails.application.routes.draw do
  root to: "users#show"
  
  devise_for :users
  resources :groups
  resources :clothes
  resources :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
