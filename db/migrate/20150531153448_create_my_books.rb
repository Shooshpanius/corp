class CreateMyBooks < ActiveRecord::Migration
  def change
    create_table :my_books do |t|
      t.string   "fio"
      t.string   "position"
      t.string   "department"
      t.string   "organisation"
      t.string   "address"
      t.string   "email_1"
      t.string   "email_2"
      t.string   "phone_1"
      t.string   "phone_2"
      t.string   "phone_1_add"
      t.string   "phone_2_add"
      t.integer  "cnt_phones"
      t.integer  "cnt_email"
      t.belongs_to :User
      t.boolean  "shared"

      t.timestamps null: false
    end
  end
end
