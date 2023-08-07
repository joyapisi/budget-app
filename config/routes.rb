Rails.application.routes.draw do
  root to: "users#show"
  
  devise_for :users
  resources :groups
  resources :clothes
  resources :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :new, :create] do 
    resources :clothes, only: [:index, :show, :new, :create, :destroy] do
      resources :all_spendings, only: [:index, :show, :new, :create, :destroy]
    end
    resources :groups, only: [:index, :show, :new, :create, :destroy] do
      resources :all_spendings, only: [:index, :show, :new, :create, :destroy] do
    end
    resources :spending_list, only: [:index, :show, :new, :create]
  end
end
post 'spending_list/group_id=:group_id', to: 'groups#generate_spending_list', as: 'generate_spending_list'
get 'spending_list/group_id=:group_id', to: 'groups#generate', as: "spending_list"
resources :public_groups
end
