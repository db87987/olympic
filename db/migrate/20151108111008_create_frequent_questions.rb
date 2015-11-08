class CreateFrequentQuestions < ActiveRecord::Migration
  def change
    create_table :frequent_questions do |t|
      t.integer :sn
      t.text :question
      t.text :answer
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
