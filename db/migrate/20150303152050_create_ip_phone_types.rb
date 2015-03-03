class CreateIpPhoneTypes < ActiveRecord::Migration
  def change
    create_table :ip_phone_types do |t|

      t.string :model, :limit => 32
      t.integer :num_account
      t.string :manufacturer, :limit => 32

      t.timestamps null: false
    end
  end
end
