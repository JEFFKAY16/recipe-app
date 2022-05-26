Rails.application.routes.draw do
  root "public_recipes#index"

  resources :recipes, only: [:index, :show, :new, :create]

  resources :recipes do
    resources :recipe_food, only: [:show, :new, :create, :edit, :update, :destroy]
    member do
      get :delete
    end
  end
  resources :foods, only: [:index]
  resources :general_shopping_list, only: [:index]
  resources :public_recipes, only: [:index]
end
