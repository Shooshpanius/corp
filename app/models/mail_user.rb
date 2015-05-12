class MailUser < ActiveRecord::Base

  t.string :email, null: false
  t.string :password, null: false
  t.boolean :ext, default: nil
  t.boolean :active, default: true
  t.string :name

end
