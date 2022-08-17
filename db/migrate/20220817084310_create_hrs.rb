class CreateHrs < ActiveRecord::Migration[6.1]
  def change
    create_table :hrs do |t|
      t.references :admin
      t.string :name 
      t.integer :phone_no
      t.integer :age
      t.string :address
      t.timestamps
    end
  end
end
