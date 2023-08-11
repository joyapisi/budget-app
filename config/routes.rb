Rails.application.routes.draw do
  root to: "groups#index"
  
  devise_for :users
  resources :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    resources :groups, only: [:index, :show, :new, :create, :destroy] do
      resources :clothes, only: [:index, :show, :new, :create, :destroy]
    end  
    get '/landing_page', to: 'landing_page#index'
end
