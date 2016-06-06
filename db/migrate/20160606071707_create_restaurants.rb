class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false, index: true
      t.text :address
      t.string :phone_number
      t.belongs_to :restaurant_category, index: true

      t.timestamps null: false
    end
  end
end
