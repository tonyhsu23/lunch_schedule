class AddForeignKeysToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :company, index: true
    add_foreign_key :users, :companies

    add_reference :users, :department, index: true
    add_foreign_key :users, :departments
  end
end
