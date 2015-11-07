class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.integer :document_type_id
      t.text :text
      t.attachment :document_file

      t.timestamps null: false
    end
  end
end
