class MailAliasByUser < ActiveRecord::Base
  belongs_to :mail_user
  belongs_to :mail_alias
end
