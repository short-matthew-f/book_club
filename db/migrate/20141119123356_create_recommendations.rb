class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :user_id,      null: false
      t.integer :recipient_id, null: false
      t.integer :book_id,      null: false
      
      t.text :description, null: false
      t.text :inscription, null: false
      
      t.timestamps
    end
    
    add_index :recommendations, :user_id
    add_index :recommendations, :recipient_id
    add_index :recommendations, :book_id
    
    add_index :recommendations, [:user_id, :recipient_id, :book_id], unique: true
  end
end
