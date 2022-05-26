class GeneralShoppingListController < ApplicationController
  def index
    @user = current_user
    @foods = @user.foods
    @recipes = Recipe.where(user_id: current_user)
    @total_price = 0

    @quantity = 0

    @foods.each do |food|
      @quantity += RecipeFood.joins(:food).where(food_id: food.id).sum('quantity') * food.price
    end
  end
end
