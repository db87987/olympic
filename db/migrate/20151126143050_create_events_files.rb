class CreateEventsFiles < ActiveRecord::Migration
  def change
    create_table :info_files do |t|
      t.string :title
      t.attachment :file
      t.integer :event_id
      t.timestamps null: false
    end
    create_table :tasks_files do |t|
      t.string :title
      t.attachment :file
      t.integer :event_id
      t.timestamps null: false
    end
    create_table :events_files do |t|
      t.string :title
      t.attachment :file
      t.integer :event_id
      t.timestamps null: false
    end
  end
end
