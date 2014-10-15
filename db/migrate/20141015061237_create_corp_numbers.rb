class CreateCorpNumbers < ActiveRecord::Migration
  def change
    create_table :corp_numbers do |t|

      t.belongs_to :address_book_corp
      t.string   'type'

      t.timestamps null: false
    end
  end
end
