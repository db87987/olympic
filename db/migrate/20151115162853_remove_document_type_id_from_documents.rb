class RemoveDocumentTypeIdFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :document_type_id
  end
end
