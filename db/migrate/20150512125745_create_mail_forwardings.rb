class CreateMailForwardings < ActiveRecord::Migration
  def change
    create_table :mail_forwardings do |t|
      t.belongs_to :address_book_corp
      t.string :source, null: false
      t.text :destination, null: false
      t.timestamps null: false
    end
  end
end
