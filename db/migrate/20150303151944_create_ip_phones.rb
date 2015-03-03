class CreateIpPhones < ActiveRecord::Migration
  def change
    create_table :ip_phones do |t|

      t.string :mac, :limit => 8
      t.belongs_to :ip_phone_type
      t.integer :account_number
      t.belongs_to :corp_number

      t.timestamps null: false
    end
  end
end
