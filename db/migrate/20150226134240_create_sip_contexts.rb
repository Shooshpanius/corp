class CreateSipContexts < ActiveRecord::Migration
  def change
    create_table :sip_contexts do |t|
      t.string :name, :limit => 32
      t.string :color, :limit => 11

      t.timestamps null: false
    end
  end
end
