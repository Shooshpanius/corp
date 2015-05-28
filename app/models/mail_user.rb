class MailUser < ActiveRecord::Base

  has_many :mail_alias_by_users
  has_many :mail_aliases, through: :mail_alias_by_users


  def MailUser.get_list(list)

    if list.to_s.length == 1
      mailboxes = MailUser.where('email like ?', list.to_s+'%').order('email ASC')
    elsif list.to_s == 'all' or list.to_s.length == 0
      mailboxes = MailUser.all.order('email ASC')
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

end
