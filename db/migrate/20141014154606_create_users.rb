class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string   "login"
      t.string   "f_name"
      t.string   "i_name"
      t.string   "o_name"
      t.string   "fio"
      t.string   "email"
      t.string   "department"
      t.string   "position"
      t.boolean   "use_password"
      t.string   "password"
      t.boolean  "active"
      t.boolean  "site_admin"
      t.boolean  "domain_admin"

      t.timestamps null: false
    end
  end
end
