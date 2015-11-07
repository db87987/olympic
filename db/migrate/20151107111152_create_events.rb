class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :category_id
      t.date :start_date
      t.date :end_date
      t.integer :subject_id
      t.boolean :info_activated, default: false
      t.text :info_text
      t.attachment :info_file
      t.boolean :tasks_activated, default: false
      t.text :tasks_text
      t.attachment :tasks_file
      t.boolean :events_activated, default: false
      t.text :events_text
      t.attachment :events_file
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
