class Mailadmin::AliasesController < ApplicationController

  before_filter :is_login

  def list
    aliases = MailAlias.all

    @form_data = {
        aliases: aliases
    }
  end


  def edit
    al = MailAlias.find(params[:id])
    mail_users = MailUser.where('mail_domain_id = ?', params[:id]).order('email asc')
    @form_data = {
        al: al,
        mail_users: mail_users
    }
  end


  def srv_check_alias
    if MailAlias.find_by_alias(params[:Alias])
      render text: 'false'
    else
      render text: 'true'
    end
  end


  def srv_alias_new_save
    MailAlias.create(
        alias: params[:Alias]
    )
    render nothing: true
  end


  def srv_user_to_alias
    # MailAlias.create(
    #     alias: params[:Alias]
    # )
    render nothing: true
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
