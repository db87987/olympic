class AddUserIdToResources < ActiveRecord::Migration
  def change
    add_column :events, :user_id, :integer
    add_column :articles, :user_id, :integer
    add_column :frequent_questions, :user_id, :integer
  end
end
