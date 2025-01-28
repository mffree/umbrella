# These gems will be installed through Gemfile
# Must first run bundle install
require "dotenv/load" # allows you to pull in ENV vars
require "http"
require "json"

# Ask user for location
pp "Hey where are you?"
# user_loc_raw = gets # commented out for development
user_loc_raw = "Chicago Booth Harper Center" # hardcode a location for development purposes
user_loc = user_loc_raw.chomp
pp user_loc

# Get lat and long from Google maps
gmaps_api_key = ENV.fetch("GMAPS_KEY")
gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_loc}&key=#{gmaps_api_key}"
# pp gmaps_url

gmaps_response_string = HTTP.get(gmaps_url).to_s
# pp gmaps_response_string
gmaps_response_parsed = JSON.parse(gmaps_response_string) # parses the JSON into a Ruby Hash
# pp gmaps_response_parsed

# Getting the location from the JSON
# Had to copy the printed gmaps_url into the browser and manually inspect the JSON to figure out how it was structured. I tried to use Envoy but I couldn't figure out how to input the Gmaps API Key
# The hashes are inside some arrays
pp gmaps_location = gmaps_response_parsed.fetch("results")[0].fetch("navigation_points")[0].fetch("location") # using fetch to find the values associated with specific keys in gmaps_response.parsed, which is a Hash
lat = gmaps_location.fetch("latitude")
pp lat
long = gmaps_location.fetch("longitude")
pp long


# Get weather at user's coordinates through Pirate Weather

# Get API key
# I first had to copy the API key from the Secrets page of the class website to the .env file
pirate_weather_api_key = ENV.fetch("PIRATE_WEATHER_KEY")

# Dig around the Pirate Weather website to find how their API is structured: https://docs.pirateweather.net/en/latest/API/
# API request structure: https://api.pirateweather.net/forecast/[apikey]/[latitude],[longitude]

# CREATE MY URL
weather_url = https://api.pirateweather.net/forecast/#???{"PIRATE_WEATHER_KEY"}/[latitude],[longitude]


# Display current temp and summary of weather for next hour
