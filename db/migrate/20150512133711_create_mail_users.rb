class CreateMailUsers < ActiveRecord::Migration
  def change
    create_table :mail_users do |t|

      t.timestamps null: false
    end
  end
end
