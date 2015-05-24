class CreateMailRelays < ActiveRecord::Migration
  def change
    create_table :mail_relays do |t|

      t.boolean :ext, default: nil
      t.string :host, null: false

      t.timestamps null: false
    end
  end
end
