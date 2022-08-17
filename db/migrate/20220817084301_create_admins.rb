class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :name 
      t.integer :phone_no
      t.integer :age
      t.string :address
      t.timestamps
    end
  end
end
