class CreateCorpNumbers < ActiveRecord::Migration
  def change
    create_table :corp_numbers do |t|

      t.belongs_to :address_book_corp
      t.string    :number
      t.string     :type_n

      t.timestamps null: false
    end
  end
end
