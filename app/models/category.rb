class Category < ActiveRecord::Base
  belongs_to :department
  has_many :events
end
