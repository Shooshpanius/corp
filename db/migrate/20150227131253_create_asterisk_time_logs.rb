class CreateAsteriskTimeLogs < ActiveRecord::Migration
  def change
    create_table :asterisk_time_logs do |t|

      t.integer :callid
      t.string :uniqueid, :limit => 32
      t.datetime :calltime_point
      t.string :context, :limit => 32
      t.string :descr, :limit => 32

      t.timestamps null: false
    end
  end
end
