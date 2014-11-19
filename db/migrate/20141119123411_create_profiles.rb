class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id, null: false
      
      t.string  :name 
      t.string  :location
      t.text    :bio
      
      t.timestamps
    end
  end
end
