class Mailadmin::AliasesController < ApplicationController

  before_filter :is_login

  def list
    aliases = MailAlias.all

    @form_data = {
        aliases: aliases
    }

  end


  private
  def is_login
    if !session[:is_login]
      user = User.where("auth_hash = ?", cookies[:hash]).take(1)
      if user.size == 1
        session[:is_login] = true
        session[:user_id] = user[0].id
        session[:user_login] = user[0].login
        session[:is_admin] = true if user[0].site_admin
      end
    end
  end

end
