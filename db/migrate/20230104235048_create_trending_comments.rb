class CreateTrendingComments < ActiveRecord::Migration[6.1]
  def change
    create_table :trending_comments do |t|
    t.string :comment
    t.integer :trending_id
    t.integer :popcorn_rating
    t.timestamp :created_at
    t.timestamp :updated_at
    end
  
  end
end
