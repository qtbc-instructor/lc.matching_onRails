class CreateFreedays < ActiveRecord::Migration[5.0]
  def change
    create_table :freedays do |t|
      t.integer :user_id
      t.date :begin
      t.date :end

      t.timestamps
    end
  end
end
