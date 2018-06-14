class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.integer :user_id
      t.string :companyname

      t.timestamps
    end
  end
end
