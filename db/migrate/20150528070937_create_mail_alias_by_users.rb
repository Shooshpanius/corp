class CreateMailAliasByUsers < ActiveRecord::Migration
  def change
    create_table :mail_alias_by_users do |t|
      t.belongs_to :mail_user
      t.belongs_to :mail_alias
      t.string :mail_user_str, null: false
      t.string :mail_alias_str, null: false
      t.timestamps null: false
    end
  end
end
