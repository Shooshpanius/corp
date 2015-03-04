class CreateIpPhones < ActiveRecord::Migration
  def change
    create_table :ip_phones do |t|

      t.string :mac, :limit => 12
      t.belongs_to :ip_phone_type
      t.integer :account_number
      t.integer :corp_number
      t.string :building
      t.string :room

      t.timestamps null: false
    end
  end
end
