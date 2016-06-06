class CreateEventDishes < ActiveRecord::Migration
  def change
    create_table :event_dishes do |t|
      t.belongs_to :event, index: true
      t.belongs_to :dish, index: true

      t.timestamps null: false
    end
  end
end
