class Survey < ActiveRecord::Base
  has_many :survey_options, :dependent => :destroy
  accepts_nested_attributes_for :survey_options, :allow_destroy => true
end
