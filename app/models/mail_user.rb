class MailUser < ActiveRecord::Base

  has_many :mail_alias_by_users
  has_many :mail_aliases, through: :mail_alias_by_users
  belongs_to :mail_domain

  def MailUser.get_list(domain_id, first_letter)

    if domain_id == ''
      if first_letter.to_s.length == 1
        mailboxes = MailUser.where('email like ?', first_letter.to_s+'%').order('email ASC')
      elsif first_letter.to_s == 'all' or first_letter.to_s.length == 0
        mailboxes = MailUser.all.order('email ASC')
      end
    else
      if first_letter.to_s.length == 1
        mailboxes = MailUser.where('email like ? AND mail_domain_id = ?', first_letter.to_s+'%', domain_id).order('email ASC')
      elsif first_letter.to_s == 'all' or first_letter.to_s.length == 0
        mailboxes = MailUser.where('mail_domain_id = ?', domain_id).order('email ASC')
      end
    end

    mailboxes.each do |mailbox|
      sotr = AddressBookCorp.where('email = ?', mailbox.email).first
      if sotr != nil
        mailbox.address_book_corp_id = sotr
        mailbox.name = sotr.fio
        mailbox.org = sotr.organisation
      end
    end

    return mailboxes
  end

  def MailUser.rev_act(mailbox_id)
    mail_user = MailUser.find(mailbox_id)

    mail_user.update(
      active: !mail_user.active
    )

    return mail_user

  end




  def MailUser.is_mailbox(domain_id, mailbox)
    full_name = mailbox + '@' + MailDomain.find(domain_id).domain
    mailboxes = MailUser.where('email = ?', full_name).size
    if mailboxes != 0
      return 'false'
    else
      return 'true'
    end
  end




end
