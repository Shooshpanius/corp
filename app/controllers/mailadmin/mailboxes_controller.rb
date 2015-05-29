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
    if params[:external].present?
      relay_back = MailRelay.where("ext = ?", 1).first.host
      relay_front = 'virtual'
      ext = 1
    else
      relay_back = 'virtual'
      relay_front = MailRelay.where("ext = ?", 0).first.host
      ext = 0
    end


    MailUser.create(
        email: params[:mailbox].to_s+"@"+MailDomain.find(params[:domain_user]).domain.to_s,
        active: 1,
        password: SecureRandom.random_number(36**12).to_s(36).rjust(12, "0"),
        relay_back: relay_back,
        relay_front: relay_front,
        ext: ext,
        mail_domain_id: params[:domain_user]

    )

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
