class Document < ActiveRecord::Base
  has_attached_file :document_file
  do_not_validate_attachment_file_type :document_file
end
