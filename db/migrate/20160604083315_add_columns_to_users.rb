class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, null: false, default: ""
    add_column :users, :last_name, :string, null: false, default: ""
    add_column :users, :chinese_first_name, :string
    add_column :users, :chinese_last_name, :string
    add_column :users, :is_serving, :boolean

    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, :chinese_first_name
    add_index :users, :chinese_last_name
  end
end
