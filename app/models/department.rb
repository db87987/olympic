class Department < ActiveRecord::Base
  has_many :categories
  has_many :users
end
