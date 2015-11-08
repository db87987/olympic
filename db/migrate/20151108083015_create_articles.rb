class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :category_id
      t.date :date
      t.text :text
      t.attachment :image

      t.timestamps null: false
    end
  end
end
