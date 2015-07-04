class CreateMailForwardByUsers < ActiveRecord::Migration
  def change
    create_table :mail_forward_by_users do |t|
      t.belongs_to :mail_forwards
      t.string :mail_user_str, null: false
      t.string :mail_alias_str, null: false
      t.timestamps null: false
    end
  end
end
