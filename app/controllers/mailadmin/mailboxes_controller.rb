class Mailadmin::MailboxesController < ApplicationController
  before_filter :is_login

  def list

    # if params[:id].to_s.length == 1
    #   @form_data = {
    #       mailboxes: MailUser.where('email like ?', params[:id].to_s+'%').order('email ASC'),
    #   }
    # elsif params[:id].to_s == 'all'
    #   @form_data = {
    #       mailboxes: MailUser.all.order('email ASC'),
    #   }
    # end

    @form_data = {
        mailboxes: MailUser.get_list(params[:id])
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
