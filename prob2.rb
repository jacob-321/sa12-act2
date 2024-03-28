require 'httparty'

def price_tracker

  http = HTTParty.get("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")
  json_extract = JSON.parse(http.body)

  crypto_data = json_extract.sort_by {|output| -output["market_cap"]}

  count = 0

  crypto_data.each do |output|
    break if count == 5

    puts "Name: #{output["name"]}"
    puts "Current price: $#{output["current_price"]}"
    puts "Market capitalization: $#{output["market_cap"]}"


    count += 1
  end
end

price_tracker
