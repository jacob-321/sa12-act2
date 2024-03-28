require 'httparty'

def time_converter

  http = HTTParty.get("http://worldtimeapi.org/api/timezone/Europe/London")
  json_extract = JSON.parse(http.body)

  time = json_extract["datetime"]

  puts "The current time in Europe/London is #{time}"

end

time_converter
