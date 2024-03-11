require 'dotenv/load'
require 'resolv-replace'
require 'net/http'
require 'uri'
require 'json'

uri = URI("https://api.getrewardful.com/v1/affiliates/#{ENV['AFFILIATE_ID']}")

request = Net::HTTP::Get.new(uri)
request.basic_auth(ENV['REWARDFUL_API_SECRET'], '')


response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
  http.request(request)
end

puts JSON.parse(response.body)
