class CreateStatusMasters < ActiveRecord::Migration[5.0]
  def change
    create_table :status_masters do |t|
      t.string :state

      t.timestamps
    end
  end
end
