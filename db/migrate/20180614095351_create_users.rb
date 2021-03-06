class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :tel, unique: true
      t.string :mail_address, unique: true
      t.string :string
      t.string :pass
      t.string :string
      t.string :usertype
      t.string :integer

      t.timestamps
    end
  end
end
