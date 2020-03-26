class ArticlesController < ApplicationController
  before_action :restrict_access, only: %i[new create index]

  def index
  end

  def create
  end

  def new
  end
end
