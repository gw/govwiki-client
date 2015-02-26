# use this script to get data from mongolab and store it in local relational database for exploration...
#   reference: https://github.com/mongodb/mongo-ruby-driver/wiki/Tutorial

require 'mongo'
require 'pry'

include Mongo

uri = "mongodb://govwiki-client:g0vw1k1@ds045521.mongolab.com:45521/govwiki"
client = MongoClient.from_uri(uri)

database = client.db("govwiki")
govs = database.collection("govs")

govs.stats
#=> {"ns"=>"govwiki.govs",
# "count"=>91351,
# "size"=>61338768,
# "avgObjSize"=>671,
# "storageSize"=>86310912,
# "numExtents"=>10,
# "nindexes"=>1,
# "lastExtentSize"=>27869184,
# "paddingFactor"=>1.0,
# "systemFlags"=>1,
# "userFlags"=>1,
# "totalIndexSize"=>2976064,
# "indexSizes"=>{"_id_"=>2976064},
# "ok"=>1.0}

govs.find_one
#=> {"_id"=>BSON::ObjectId('54e6414353a229d7a2e90e87'),
# "census_id"=>1100100100000,
# "gov_name"=>"COUNTY OF AUTAUGA",
# "special_district_function_code"=>"",
# "gov_type"=>"General Purpose",
# "census_contact"=>"Chairman",
# "address1"=>"134 N COURT ST",
# "address2"=>"STE 101",
# "city"=>"PRATTVILLE",
# "state"=>"AL",
# "zip"=>36067,
# "web_site"=>"",
# "population"=>54571,
# "population_as_of_year"=>2010,
# "enrollment"=>"",
# "enrollment_as_of_year"=>"",
# "fips_state"=>1,
# "fips_county"=>1,
# "fips_place"=>99001,
# "county_area_name"=>"AUTAUGA",
# "county_area_type"=>"COUNTY"}

govs.find({"state" => "CT"}).count
#=> 790

govs.find.each_slice(250) do |some_govs|
  puts "PROCESSING #{some_govs.class} of #{some_govs.count} GOVS"
end
