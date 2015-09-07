class Mailadmin::MailboxesController < ApplicationController
  before_filter :is_login

  def list
    @form_data = {
        # mailboxes: MailUser.get_list(params[:id]),
        domains: MailDomain.all,
        relays: MailRelay.all
    }
  end


  def srv_get_users
    @form_data = {
        mailboxes: MailUser.get_list(
            params[:domain_id],
            params[:first_letter]
        ),
        domains: MailDomain.all,
        relays: MailRelay.all
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

    MailUser.create(
        email: params[:mailbox].to_s+"@"+MailDomain.find(params[:domain_user]).domain.to_s,
        active: 1,
        password: SecureRandom.random_number(36**12).to_s(36).rjust(12, "0"),
        relay_back: 'virtual',
        relay_front: MailRelay.find(params[:relay]).host,
        mail_domain_id: params[:domain_user]
    )
    render nothing: true
  end


  def srv_get_pwd
    pwd = MailUser.find(params[:mailbox_id]).password
    render text: pwd
  end


  def srv_get_user_fio
    get_fio = AddressBookCorp.where("email = ?", params[:email])
    if get_fio.size != 0
      fio = get_fio.first.fio
    end
    render text: fio
  end

  def srv_get_user_org
    get_org = AddressBookCorp.where("email = ?", params[:email])
    if get_org.size != 0
      org = get_org.first.organisation
    end
    render text: org
  end


  def srv_rev_act

    @form_data = {
        mailbox: MailUser.rev_act(
            params[:mailbox_id]
        )
    }
    render layout: false

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
      else
        redirect_to '/'
      end
    end
  end

end
