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

  def edit; end

  def update; end

  def delete; end

  def destroy; end

  private

  def recipe_foods_params
    params.require(:recipe_foods).permit(:food_id, :quantity)
  end
end
