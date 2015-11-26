class Contact < ActiveRecord::Base
  has_attached_file :photo, styles: { small: "77x77#" }
  validates_attachment :photo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  belongs_to :event

  def from_event?
    self.event_id.present?
  end

  def full_name
    "#{lastname} #{firstname} #{middlename}"
  end
end
