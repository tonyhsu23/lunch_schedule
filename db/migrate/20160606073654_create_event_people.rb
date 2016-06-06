class CreateEventPeople < ActiveRecord::Migration
  def change
    create_table :event_people do |t|
      t.belongs_to :event, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
