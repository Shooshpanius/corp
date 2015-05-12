class CreateMailDomains < ActiveRecord::Migration
  def change
    create_table :mail_domains do |t|
      t.string :domain, null: false
      t.timestamps null: false
    end
  end
end
