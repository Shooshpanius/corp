class MainController < ApplicationController


  before_filter :is_login



  def index


  end



  private
  def is_login
    if !session[:is_login]
      redirect_to "/login"
    end
  end


end
