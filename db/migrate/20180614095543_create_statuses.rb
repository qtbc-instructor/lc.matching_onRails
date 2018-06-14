class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.integer :user_id
      t.integer :company_id
      t.integer :skill_master_id
      t.integer :status_master_id
      t.date :date
      t.integer :score

      t.timestamps
    end
  end
end
