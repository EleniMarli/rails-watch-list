require 'json'
require 'open-uri'

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

indeces = (0..19).to_a.sample(10)

parsed = JSON.parse(URI.open('https://tmdb.lewagon.com/movie/top_rated').read)

indeces.each do |index|
  movie = parsed['results'][index]
  Movie.create(title: movie['original_title'], overview: movie['overview'], poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}", rating: movie['vote_average'].round(1))
end
