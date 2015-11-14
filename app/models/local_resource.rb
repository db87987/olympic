class LocalResource < ActiveRecord::Base
  has_attached_file :image, styles: { icon: "90x69#", front: "250x79#" }
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
