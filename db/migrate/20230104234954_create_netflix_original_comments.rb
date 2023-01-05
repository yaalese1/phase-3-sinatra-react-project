class CreateNetflixOriginalComments < ActiveRecord::Migration[6.1]
  
    def change
      create_table :netflix_original_comments do |t|
      t.string :comment
      t.integer :netflix_original_id
      t.integer :popcorn_rating
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
