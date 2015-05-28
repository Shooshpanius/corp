class MailAlias < ActiveRecord::Base

  has_many :mail_alias_by_users
  has_many :mail_users, through: :mail_alias_by_users


end
