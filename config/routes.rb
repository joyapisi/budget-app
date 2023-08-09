Rails.application.routes.draw do
  resources :group_clothes
  root to: "clothes#index"
  
  devise_for :users
  resources :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    resources :groups, only: [:index, :show, :new, :create, :destroy] do
      resources :clothes, only: [:index, :show, :new, :create, :destroy]
    end  

end
