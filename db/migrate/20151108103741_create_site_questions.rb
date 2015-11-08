class CreateSiteQuestions < ActiveRecord::Migration
  def change
    create_table :site_questions do |t|
      t.string :name
      t.text :question
      t.string :email

      t.timestamps null: false
    end
  end
end
