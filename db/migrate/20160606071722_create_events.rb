class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date , index: true
      t.belongs_to :restaurant, index: true

      t.timestamps null: false
    end
  end
end
