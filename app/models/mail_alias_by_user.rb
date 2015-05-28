class MailAliasByUser < ActiveRecord::Base
  belongs_to :mail_user
  belongs_to :mail_alias


  def MailAliasByUser.set(alias_id, user_id, is_check)

    MailAliasByUser.where("mail_alias_id = ? AND mail_user_id = ?", alias_id, user_id).destroy_all

    if is_check == 'true'
      MailAliasByUser.create(
          mail_alias_id: alias_id,
          mail_user_id: user_id,
          mail_alias_str: MailAlias.find(alias_id).alias,
          mail_user_str: MailUser.find(user_id).email
      )
    end

    return MailAliasByUser.where("mail_alias_id = ? AND mail_user_id = ?", alias_id, user_id).size

  end

end
