class ArticlesController < ApplicationController
  before_action :restrict_access, only: %i[new create]

  def index
    @categories = Category.all.by_priority
  end

  def create
    @article = Article.create(title: params[:title], text: params[:text], user_id: current_user.id, image: params[:image])
    # @article = Article.new(article_params)
    # @article.image.attach(params[:image])
    
    # File.open('somewhere') do |f|
    #   @article.picture = f
    # end
    # @article.image.attach(params[:image])
    # respond_to do |format|
    #   if @article.save
    #     format.html { redirect_to @article, notice: 'Post was successfully created.' }
    #     format.json { render :show, status: :created, location: @article }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    #   end
    # end
  if @article.image.attached?
    @article.save
    # @article.image.attach(params[:image])
    # @article.save
    redirect_to '/'
  else
    flash[:danger] = 'article text or title cannot be empty'
    redirect_to '/add_article'
  end
  end

  def new
  end

  def show
    @article=Article.find(params[:id])
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