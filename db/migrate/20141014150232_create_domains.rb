class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|

      t.string :host
      t.integer :port
      t.string :name

      t.timestamps null: false
    end
  end
end
