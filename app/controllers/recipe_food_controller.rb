class RecipeFoodController < ApplicationController
  def index; end

  def show; end

  def new
    @foods = current_user.foods
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_foods_params)
    if @recipe_food.save
      redirect_to(recipes_path)
      flash[:success] = 'Recipe Food was successfully added.'
    else
      render('new')
      flash[:failed] = 'Recipe Food was not added - please fix the error(s)'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.destroy
      redirect_to(recipes_path)
      flash[:success] = 'Deleted'
    else
      redirect_to(recipes_path)
      flash[:success] = 'Error Deleting'
    end
  end

  private

  def recipe_foods_params
    params.require(:recipe_foods).permit(:food_id, :quantity)
  end
end
