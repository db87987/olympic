class CreateLocalResources < ActiveRecord::Migration
  def change
    create_table :local_resources do |t|
      t.string :title
      t.string :url
      t.attachment :image

      t.timestamps null: false
    end
  end
end
