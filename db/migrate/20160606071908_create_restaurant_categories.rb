class CreateRestaurantCategories < ActiveRecord::Migration
  def change
    create_table :restaurant_categories do |t|
      t.string :name, null: false, index: true

      t.timestamps null: false
    end
  end
end
