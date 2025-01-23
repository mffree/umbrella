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
gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_loc}&key=#{ENV.fetch("GMAPS_KEY")}"
# pp gmaps_url

gmaps_response_string = HTTP.get(gmaps_url).to_s
# pp gmaps_response_string
gmaps_response_parsed = JSON.parse(gmaps_response_string)
# pp gmaps_response_parsed

# pp gmaps_response_parsed.keys
pp gmaps_location = gmaps_response_parsed.fetch("results")[0].fetch("navigation_points")[0].fetch("location")
lat = gmaps_location.fetch("latitude")
pp lat
long = gmaps_location.fetch("longitude")
pp long


# Get weather at user's coordinates through Pirate Weather



# Display current temp and summary of weather for next hour
