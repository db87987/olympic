class CreateEventsSubjects < ActiveRecord::Migration
  def change
    create_table :events_subjects do |t|
      t.integer :event_id
      t.integer :subject_id
    end
  end
end
