class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :zipcode, :integer, null: false
    add_column :users, :address, :string, null: false
    add_column :users, :profile, :text
  end
end
