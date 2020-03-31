class ArticlesController < ApplicationController
  before_action :restrict_access, only: %i[new create]

  def index
    @categories = Category.all.by_priority
    @most_voted_article = most_voted_article
  end

  def create
    @article = Article.create(title: params[:title], text: params[:text], user_id: current_user.id, image: params[:image])
  if @article.image.attached? && @article.valid? && !params[:category_ids].nil?
    @article.save
    params[:category_ids].each do |category_id|
      ac = ArticleCategory.new(category_id: category_id, article_id: @article.id)
      ac.save
    end
    redirect_to '/'
  else
    flash[:danger] = 'article is invalid'
    redirect_to '/add_article'
  end
  end

  def new
    @categories = Category.all
  end

  def show
    @article=Article.find(params[:id])
    @list_categories = []
    @article.categories.each{|c| @list_categories.push(c.name)}
    if params[:vote]=='1'
      vote = Vote.new(user_id: current_user.id, article_id: @article.id)
      vote.save
    elsif params[:vote]=='0'
      Vote.destroy(@article.votes.first{|v| v.user_id==current_user.id}.id)
    end
  end

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end