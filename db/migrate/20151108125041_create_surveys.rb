class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.text :question
      t.date :start_date
      t.date :end_date
      t.boolean :show

      t.timestamps null: false
    end
  end
end
