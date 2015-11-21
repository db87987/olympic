class FrequentQuestion < ActiveRecord::Base
  belongs_to :user
  scope :published, -> { where(published: true) }
end
