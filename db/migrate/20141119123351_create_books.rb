class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title,  null: false
      t.string :author, null: false
      t.string :cover_url
      t.string :asin,   null: false
      
      t.timestamps
    end
    
    add_index :books, :title
    add_index :books, :author
    add_index :books, :asin, unique: true
  end
end
