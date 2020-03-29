class CategoriesController < ApplicationController
  def show
    @articles = Category.find(params[:id].to_i).articles
  end

  def index
  end
end
