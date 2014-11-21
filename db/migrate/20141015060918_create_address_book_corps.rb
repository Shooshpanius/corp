class CreateAddressBookCorps < ActiveRecord::Migration
  def change
    create_table :address_book_corps do |t|

      t.string   "login"
      t.string   "fio"
      t.string   "email"
      t.string   "position"
      t.string   "department"
      t.string   "organisation"
      t.string   "address"
      t.boolean  "have_phones"
      t.boolean  "have_email"
      t.boolean  "active"

      t.timestamps null: false
    end
  end
end
