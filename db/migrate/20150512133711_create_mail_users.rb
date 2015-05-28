class CreateMailUsers < ActiveRecord::Migration
  def change
    create_table :mail_users do |t|

      t.string :email, null: false
      t.string :password, null: false
      t.boolean :ext, default: nil
      t.boolean :active, default: true
      t.string :relay_back, null: false
      t.string :relay_front, null: false
      t.string :name
      t.string :org
      t.belongs_to :address_book_corp
      t.belongs_to :mail_domain


      t.timestamps null: false
    end
  end
end
