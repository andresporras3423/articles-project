class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
  
    private
  
    def restrict_access
      redirect_to '/login' unless logged_in?
    end
  end