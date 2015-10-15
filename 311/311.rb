require 'httparty'
require 'pry'

url = 'https://data.wprdc.org/api/action/datastore_search?resource_id=40776043-ad00-40f5-9dc8-1fde865ff571'
response = HTTParty.get url

data = JSON.parse response.body
records = data["result"]["records"]

records = records.group_by{|r| r["NEIGHBORHOOD"]}

records.each do |name, records|
  puts "#{name} had #{records.count} incidents"
end
