class MailUser < ActiveRecord::Base

  def MailUser.get_list(list)

    if list.to_s.length == 1
      mailboxes = MailUser.where('email like ?', list.to_s+'%').order('email ASC')
    elsif list.to_s == 'all' or list.to_s.length == 0
      mailboxes = MailUser.all.order('email ASC')
    end

    mailboxes.each do |mailbox|

      sotr = AddressBookCorp.where('email = ?', mailbox.email)

      if sotr.size == 1
        data = {
            fio: sotr[0].fio,
            org: sotr[0].organisation
        }
      else
        data = {
            fio: '-',
            org: '-'
        }
      end

      mailbox.name = data



    end


    return mailboxes

  end

end
