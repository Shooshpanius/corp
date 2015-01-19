class CreateAsteriskLogs < ActiveRecord::Migration
  def change
    create_table :asterisk_logs do |t|

      t.string :eventtype, :limit => 20
      t.datetime :eventtime
      t.string :cid_name, :limit => 80
      t.string :cid_num, :limit => 80
      t.string :cid_ani, :limit => 80
      t.string :cid_rdnis, :limit => 80
      t.string :cid_dnid, :limit => 80
      t.string :exten, :limit => 80
      t.string :context, :limit => 80
      t.string :channame, :limit => 80
      t.string :src, :limit => 80
      t.string :dst, :limit => 80
      t.string :channel, :limit => 80
      t.string :dstchannel, :limit => 80
      t.string :appname, :limit => 80
      t.string :appdata, :limit => 80
      t.integer :amaflags
      t.string :accountcode, :limit => 20
      t.string :uniqueid, :limit => 32
      t.string :linkedid, :limit => 32
      t.string :peer, :limit => 80
      t.string :userdeftype, :limit => 255
      t.string :eventextra, :limit => 255
      t.string :userfield, :limit => 255

      t.timestamps null: false
    end
  end
end
