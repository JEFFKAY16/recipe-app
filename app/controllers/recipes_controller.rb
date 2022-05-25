class RecipesController < ApplicationController
  def index
    @recipes = Recipe.order('id ASC')
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def new
    @recipe = Recipe.new
  end

  def create
    user = current_user
    # Instanciate object with parameters
    @recipe = user.recipes.new(recipe_params)
    # Save
    if @recipe.save
      # Redirect
      redirect_to(recipes_path)
      flash[:success] = 'Recipe was successfully added.'
    else
      # Redisplay Form
      render('new')
      flash[:failed] = 'Recipe was not added - please fix the error(s)'
    end
  end

  def delete
    @recipe = Recipe.find(params[:id])
  end


  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to(recipes_path)
      flash[:success] = 'Recipe was successfully deleted.'
    else
      render('delete')
      flash[:failed] = 'Recipe could not be deleted - please fix the error(s)'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end

end
