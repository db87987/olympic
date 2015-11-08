class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.string :position
      t.string :organization
      t.string :phone1
      t.string :phone2
      t.string :email
      t.attachment :photo
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
