class CreateYips < ActiveRecord::Migration[5.2]
  def change
    create_table :yips do |t|
      t.text :body, null: false
      t.integer :author_id, null: false
      t.timestamps
    end
    #always add_index to foreign keys 
    add_index :yips, :author_id 
  end
end
