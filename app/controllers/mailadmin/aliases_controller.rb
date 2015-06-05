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
    domain = MailDomain.where('domain = ?', al.alias.split("@").last).first
    mail_users = MailUser.where('mail_domain_id = ?', domain.id).order('email asc')
    in_alias = MailAliasByUser.where('mail_alias_id = ?', params[:id])

    @form_data = {
        al: al,
        mail_users: mail_users,
        in_alias: in_alias
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
    is_checked = MailAliasByUser.set(params[:alias_id], params[:user_id], params[:is_check])
    render text: is_checked
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
