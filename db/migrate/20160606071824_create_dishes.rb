class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name, null: false, index: true
      t.integer :price
      t.belongs_to :dish_category, index: true

      t.timestamps null: false
    end
  end
end
