class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id].to_i)
    @articles = @category.articles
  end

  def index
  end
end
