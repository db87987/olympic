class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_attached_file :image, styles: { medium: "240x150>" }
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
