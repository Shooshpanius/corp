class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|

      t.datetime :calldate
      t.string :src, :limit => 80
      t.string :dst, :limit => 80
      t.integer :duration
      t.integer :billsec
      t.string :disposition, :limit => 45
      t.string :uniqueid, :limit => 32


      t.timestamps null: false
    end
  end
end
