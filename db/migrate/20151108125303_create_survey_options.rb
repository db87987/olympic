class CreateSurveyOptions < ActiveRecord::Migration
  def change
    create_table :survey_options do |t|
      t.text :text
      t.integer :survey_id

      t.timestamps null: false
    end
  end
end
