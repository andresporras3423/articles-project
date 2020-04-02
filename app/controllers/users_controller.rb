class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(name: params[:name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])

    if @user.valid?
      @user.save
      redirect_to '/login'
    else
      flash[:danger] = 'form has invalid information'
      redirect_to '/signup'
    end
  end
  # Confirms a logged-in user.
  # def logged_in_user
  #   return if logged_in?

  #   store_location
  #   flash[:danger] = 'Please log in.'
  #   redirect_to login_url
  # end
end
