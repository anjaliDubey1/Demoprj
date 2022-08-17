class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_no, :integer
    add_column :users, :age, :integer
    add_column :users, :address, :string
    add_column :users, :role, :string
  end
end
