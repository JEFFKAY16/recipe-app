class Food < ApplicationRecord
  has_many :recipe_foods, foreign_key: 'food_id', class_name: 'RecipeFood'
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
end
