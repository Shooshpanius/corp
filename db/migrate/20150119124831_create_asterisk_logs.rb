class CreateAsteriskLogs < ActiveRecord::Migration
  def change
    create_table :asterisk_logs do |t|

      t.datetime :calldate
      t.string :clid, :limit => 80
      t.string :src, :limit => 80
      t.string :dst, :limit => 80
      t.string :dcontext, :limit => 80
      t.string :channel, :limit => 80
      t.string :dstchannel, :limit => 80
      t.string :lastapp, :limit => 80
      t.string :lastdata, :limit => 80
      t.integer :duration
      t.integer :billsec
      t.string :disposition, :limit => 45
      t.integer :amaflags
      t.string :accountcode, :limit => 20
      t.string :uniqueid, :limit => 32
      t.string :userfield, :limit => 255
      t.boolean :parsed

      t.timestamps null: false
    end
  end
end
