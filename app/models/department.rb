class Department < ActiveRecord::Base
  has_many :categories
end
