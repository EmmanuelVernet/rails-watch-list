require "open-uri"
require "json"

# https://tmdb.lewagon.com/movie/top_rated

puts "seeding movies from API"

movies = JSON.parse(URI.parse("https://tmdb.lewagon.com/movie/top_rated").read)
number = 0

puts "seeding starts"

Movie.destroy_all

15.times do
  number += 1 # interer dans l'array number
  movie = Movie.create(
    title: movies["results"][number]["original_title"],
    overview: movies["results"][number]["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movies["results"][number]["poster_path"]}",
    rating: movies["results"][number]["vote_average"].round(1),
  )
end

puts "seeding done"
