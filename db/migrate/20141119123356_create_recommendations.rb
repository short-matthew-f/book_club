class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :recommender_id,      null: false
      t.integer :club_id,      null: false
      t.integer :book_id,      null: false
      
      t.text :description, null: false
      t.text :inscription, null: false
      
      t.timestamps
    end
    
    add_index :recommendations, :recommender_id
    add_index :recommendations, :club_id
    add_index :recommendations, :book_id
    
    add_index :recommendations, [:recommender_id, :club_id, :book_id], unique: true
  end
end
