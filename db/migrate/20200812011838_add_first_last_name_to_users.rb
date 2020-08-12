class AddFirstLastNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :Users, :first_name, :string
    add_column :Users, :last_name, :string
  end
end
