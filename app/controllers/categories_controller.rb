class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id].to_i)
    @articles = @category.articles.order(created_at: :desc)
  end

  def index; end
end
