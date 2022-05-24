class RecipesController < ApplicationController
  def index
    @recipes = Recipe.order('id ASC')
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
