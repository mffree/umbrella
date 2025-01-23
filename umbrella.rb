# These gems will be installed through Gemfile
# Must first run bundle install
require "dotenv/load" # allows you to pull in ENV vars
require "http"
require "json"


pp "Hey where are you?"

# user_loc = gets

user_loc = "Chicago Booth Harper Center" # hardcode a location for development purposes
chomp at some point??
pp user_loc


pp gmaps_url

pp http.get(gmaps_url)
# pp env.fetch(GMAPS_KEY)


gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_loc}&key=#{ENV.fetch(GMAPS_KEY)}"
