require 'pp'
require 'json'

# {
#  "type": "FeatureCollection",

#  "features": [
#     {
#       "type": "Feature",
#       "geometry": {
#         "type": "Point",
#         "coordinates": [125.6, 10.1]
#       },
#       "properties": {
#         "name": "Dinagat Islands"
#       }
#     }
#   ]
# }

# CONVERT THIS

# console.log(superchargers);
# example structure
# [{
#   "id": 122,
#   "locationId": "sanjuancapistranosupercharger",
#   "name": "San Juan Capistrano, CA",
#   "status": "OPEN",
#   "address": {
#     "street": "31971 Camino Capistrano",
#     "city": "San Juan Capistrano",
#     "state": "CA",
#     "zip": "92675",
#     "countryId": 100,
#     "country": "USA",
#     "regionId": 100,
#     "region": "North America"
#   },
#   "gps": {
#     "latitude": 33.498458,
#     "longitude": -117.6632
#   },
#   "dateOpened": "2014-05-06",
#   "stallCount": 7,
#   "counted": true,
#   "elevationMeters": 30,
#   "powerKilowatt": 0,
#   "solarCanopy": false,
#   "battery": false,
#   "statusDays": 0,
#   "urlDiscuss": true
# }]


# INTO

# var rodents_json = {
#   "type": "FeatureCollection",
#   "features": [
#     { "type": "Feature", "id": 1,
#       "properties": { "TYPE": "Rodent Activity" },
#       "geometry": { "type": "Point", "coordinates": [ -71.157609, 42.355988 ] }
#     }
#   ]
# }

def convert_charger_data_to_geo_json_features superchargers
  sc_geo_json = {
    type: "FeatureCollection",
    features: []
  }
  superchargers.each do |sc|
    sc_geo_json[:features] << {
      type: "Feature",
      id: sc["id"],
      properties: { address: sc["address"], name: sc["name"], dateOpened: sc["dateOpened"]},
      geometry: { type: "Point", coordinates: [sc["gps"]["longitude"], sc["gps"]["latitude"]] }
    }
  end
  sc_geo_json
end

input_file_path = File.dirname(__FILE__) + "/../superchargers.json"
input = JSON.parse(File.read(input_file_path))

puts "the input class: #{input.class}"
puts input

geo_json = JSON.generate(convert_charger_data_to_geo_json_features(input))
File.open('super_charger_geo_json.json', 'w') do |fh|
  # once loaded via a script tag the superchargers variable will
  # contain the json
  fh.puts("var superchargers = " + geo_json)
end


