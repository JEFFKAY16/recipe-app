Rails.application.routes.draw do
  root "public_recipes#index"
  
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create]

  resources :recipes do
    resources :recipe_food, only: [:show, :new, :create, :edit, :update, :destroy]
    member do
      get :delete
    end
  end
  
  resources :general_shopping_list, only: [:index]
  resources :public_recipes, only: [:index]
end
