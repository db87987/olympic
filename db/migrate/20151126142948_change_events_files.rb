class ChangeEventsFiles < ActiveRecord::Migration
  def change
    drop_attached_file :events, :info_file
    drop_attached_file :events, :tasks_file
    drop_attached_file :events, :events_file
  end
end