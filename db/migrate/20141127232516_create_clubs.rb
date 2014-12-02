class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.integer :owner_id, null: false
      
      t.string  :name
      t.text    :description

      t.timestamps
    end
    
    add_index :clubs, :owner_id
  end
end
