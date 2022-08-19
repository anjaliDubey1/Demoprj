class AddEmailToHrs < ActiveRecord::Migration[6.1]
  def change
    add_column :hrs, :email, :string
  end
end
