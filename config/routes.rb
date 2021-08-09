Rails.application.routes.draw do
  devise_for :users
root to: "prototypes#index"
resources :users, only: [:new, :create, :show, :index] 
resources :prototypes do
  resources :comments, only: [:create, :new, :show]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
