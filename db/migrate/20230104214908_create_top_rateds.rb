class CreateTopRateds < ActiveRecord::Migration[6.1]
  def change
    create_table :top_rateds do |t|
      t.string :name
       t.string :poster_path
       t.string :backdrop_path
       t.string :overview 
       t.string :original_name
       t.string :original_title
       t.string :title
       
       t.timestamp :created_at
       t.timestamp :updated_at
     end
  end
end
