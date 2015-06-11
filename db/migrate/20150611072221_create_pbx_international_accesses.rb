class CreatePbxInternationalAccesses < ActiveRecord::Migration
  def change
    create_table :pbx_international_accesses do |t|

      t.integer   "number"
      t.timestamps null: false
    end
  end
end
