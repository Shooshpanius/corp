class CreateMailForwards < ActiveRecord::Migration
  def change
    create_table :mail_forwards do |t|
      t.string :email_to, null: false
      t.timestamps null: false
    end
  end
end
