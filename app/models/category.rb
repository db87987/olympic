class Category < ActiveRecord::Base
  belongs_to :department
  has_many :events
  has_many :articles
  has_many :documents
end
