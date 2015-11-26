class Event < ActiveRecord::Base
  has_and_belongs_to_many :subjects
  belongs_to :user
  belongs_to :category
  has_many :contacts, :dependent => :destroy
  has_many :info_files, :dependent => :destroy
  has_many :tasks_files, :dependent => :destroy
  has_many :events_files, :dependent => :destroy
  accepts_nested_attributes_for :contacts, :allow_destroy => true
  accepts_nested_attributes_for :info_files, :allow_destroy => true
  accepts_nested_attributes_for :tasks_files, :allow_destroy => true
  accepts_nested_attributes_for :events_files, :allow_destroy => true
  scope :published, -> { where(published: true) }
  scope :year, -> (year) { where('extract(year from start_date) = ?', year) }
  scope :month, -> (month) { where('extract(month from start_date) = ?', month) }
  scope :category_ids, -> (category_ids) { where(category_id: category_ids) }
  scope :subject_ids, -> (subject_ids) { includes(:subjects).where(subjects: {id: subject_ids}) }
end
