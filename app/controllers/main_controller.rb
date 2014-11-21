class MainController < ApplicationController


  before_filter :is_login



  def index

    # if !cookies[:user_id].nil? && session[:is_login].nil?
    #
    #   user = User.find_by_id(cookies[:user_id])
    #
    #   session[:is_login] = true
    #   session[:user_id] = user.user_id
    #   session[:user_login] = user.user_login
    #   session[:is_admin] = user.site_admin
    #
    #   render text: '!!!'
    #
    # end


  end



  private
  def is_login
    if !session[:is_login]
      redirect_to "/login"
    end
  end


end
