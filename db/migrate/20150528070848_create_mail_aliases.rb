class CreateMailAliases < ActiveRecord::Migration
  def change
    create_table :mail_aliases do |t|
      t.string :alias, null: false
      t.timestamps null: false
    end
  end
end
