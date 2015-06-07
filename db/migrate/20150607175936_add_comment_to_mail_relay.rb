class AddCommentToMailRelay < ActiveRecord::Migration
  def change
    add_column :mail_relays, :comment, :string, default: ''
  end
end
