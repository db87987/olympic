class Survey < ActiveRecord::Base
  has_many :survey_options
  accepts_nested_attributes_for :survey_options
end
