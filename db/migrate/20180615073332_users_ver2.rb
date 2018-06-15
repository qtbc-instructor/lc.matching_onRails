class UsersVer2 < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :string, :varchar
  end
end
