class CreateMailBccRecipients < ActiveRecord::Migration
  def change
    create_table :mail_bcc_recipients do |t|
      t.belongs_to :mail_user
      t.string :recipient, null: false
      t.string :copy, null: false
      t.string :srv, null: false
      t.string :comment, null: false
      t.timestamps null: false
    end
  end
end
