class Event < ActiveRecord::Base
  has_attached_file :info_file
  has_attached_file :tasks_file
  has_attached_file :events_file
  do_not_validate_attachment_file_type :info_file
  do_not_validate_attachment_file_type :tasks_file
  do_not_validate_attachment_file_type :events_file
  has_and_belongs_to_many :subjects
  belongs_to :user
  belongs_to :category
  has_many :contacts, :dependent => :destroy
  accepts_nested_attributes_for :contacts, :allow_destroy => true
  scope :published, -> { where(published: true) }
  scope :year, -> (year) { where('extract(year from start_date) = ?', year) }
  scope :month, -> (month) { where('extract(month from start_date) = ?', month) }
  scope :category_ids, -> (category_ids) { where(category_id: category_ids) }
  scope :subject_ids, -> (subject_ids) { includes(:subjects).where(subjects: {id: subject_ids}) }
end
