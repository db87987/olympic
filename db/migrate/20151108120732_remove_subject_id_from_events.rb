class RemoveSubjectIdFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :subject_id
  end
end
