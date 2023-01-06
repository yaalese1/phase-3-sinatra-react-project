class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
     get "/netflix_originals" do
     NetflixOriginal.all.to_json
    
    end
    get"/netflix_originals/:id" do
      movie = NetflixOriginal.find(params[:id])
      movie.to_json
    end

    get "/netflix_original_comments" do
      NetflixOriginalComment.all.to_json
    end

    get "/netflix_original_comments/:id" do
      comment = NetflixOriginalComment.find(params[:id])
     comment.to_json
    end

    post"/netflix_original_comments" do
      comment= NetflixOriginalComment.create(
        comment: params[:comment],
        likes: params[:likes],
        netflix_original_id: params[:mov_id])
        comment.to_json
    end
    delete"/netflix_original_comments/:id" do 
     movie=NetflixOriginalComment.find(params[:id])
     movie.destroy
     movie.to_json
    end

    patch "/netflix_original_comments/:id" do
      comment= NetflixOriginalComment.find(params[:id])
      comment.update(
      likes: params[:likes])
      comment.to_json
    end

   

    get "/comedies" do
     Comedy.all.to_json
    
    end
    get "/trendings" do
     Trending.all.to_json
    
    end

    get "/trendings/:id" do
     movie = Trending.find(params[:id])
     movie.to_json
    end

    get "/trending_comments" do
      comment = TrendingComment.all
      comment.to_json
    end

    

    post "/trending_comments" do
      comment = TrendingComment.create(
      comment: params[:comment],
      likes: params[:likes],
      trending_id: params[:mov_id])
      comment.to_json
    end

    
    get "/trending_comments/:id" do
      comment = TrendingComment.find(params[:id])
      comment.to_json
    end


    delete "/trending_comments/:id" do
      comment= TrendingComment.find(params[:id])
      comment.destroy
      comment.to_json
    end



    patch "/trending_comments/:id" do
      comment= TrendingComment.find(params[:id])
      comment.update(comment: params[:comment],
      likes: params[:likes])
       
      comment.to_json
    end
     
    get "/top_rateds" do
    TopRated.all.to_json
    end 

    
   
     
     
end
