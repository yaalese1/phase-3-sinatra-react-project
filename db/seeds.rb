require 'pry'
require 'rest_client'
require 'json'



puts "🌱 Seeding DATA..."

API_KEY = "c8808066dc7341b76e30925fdd1938ac"
baseURL = "https://api.themoviedb.org/3"
base_image_UrL = "https://image.tmdb.org/t/p/original/"

requests ={
    fetchNetflixOriginal:"/discover/tv?api_key=#{API_KEY}&with_network=213",
    fetchTrending:"/trending/all/week?api_key=#{API_KEY}&language=en-us",
    fetchTopRated:"/movie/top_rated?api_key=#{API_KEY}&language=en-US&page=1",
    fetchComedy:"/discover/movie?api_key=#{API_KEY}&with_genres=35"


}

# //iterated over the hash to get the data needed

requests.each do |key,value|
 response = RestClient.get "#{baseURL}#{value}"
 response_hash = JSON.parse(response)

 results = response_hash.map do |key2,value2|
  if(key2=='results')
      value2
  end
 end

 get_data = results[1]
 get_data.each do |mov|
   class_name_array = [NetflixOriginal,Trending,TopRated,Comedy]
   class_name_array.map do |c|
    if(c==Kernel.const_get(key.slice(5,16))) 
 #this here took the hash key name for eg - fetchNetflixOriginal AND        #slice it to only NetflixOriginal 
    c.create(
    poster_path:mov["poster_path"],
    backdrop_path:mov["backdrop_path"],
    overview:mov['overview'],
    original_name:mov['original_name'],
    name:mov['name'],
    original_title:mov['original_title'],
    title:mov['title'],
    )

    end
   end
  end
 end


puts "✅ Done seeding!"
