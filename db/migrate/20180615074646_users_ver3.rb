class UsersVer3 < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :integer, :varchar
    remove_column :users, :usertype, :varchar
  end
end
