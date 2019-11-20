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
# {
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
# }


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

def convert_charger_data_to_geo_json_features


end
