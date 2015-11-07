class Event < ActiveRecord::Base
  has_attached_file :info_file
  has_attached_file :tasks_file
  has_attached_file :events_file
  do_not_validate_attachment_file_type :info_file
  do_not_validate_attachment_file_type :tasks_file
  do_not_validate_attachment_file_type :events_file
  belongs_to :subject
  belongs_to :category
end
