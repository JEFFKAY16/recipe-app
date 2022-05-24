Rails.application.routes.draw do
  root "public_recipes#index"

  resources :recipes, only: [:index, :show]
  resources :foods, only: [:index]
  resources :general_shopping_list, only: [:index]
  resources :public_recipes, only: [:index]
end
