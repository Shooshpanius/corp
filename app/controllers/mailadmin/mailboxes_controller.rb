class Mailadmin::MailboxesController < ApplicationController
  before_filter :is_login

  def list
    @form_data = {
        # mailboxes: MailUser.get_list(params[:id]),
        domains: MailDomain.all
    }
  end


  def srv_get_users
    @form_data = {
        mailboxes: MailUser.get_list(
            params[:domain_id],
            params[:first_letter]
        ),
        domains: MailDomain.all
    }
    render layout: false
  end

  def srv_mailbox_check
    is_mailbox = MailUser.is_mailbox(
                    params[:domain_id],
                    params[:mailbox]
                )
    render text: is_mailbox
  end


  def srv_mailbox_new_save

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
