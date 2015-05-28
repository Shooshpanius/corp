class CreateMailAliasByUsers < ActiveRecord::Migration
  def change
    create_table :mail_alias_by_users do |t|
      t.belongs_to :mail_user
      t.belongs_to :mail_alias
      t.timestamps null: false
    end
  end
end
