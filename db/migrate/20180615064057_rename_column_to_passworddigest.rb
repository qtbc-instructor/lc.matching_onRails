class RenameColumnToPassworddigest < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :pass, :password_digest
  end
end
