require 'httparty'

def extract_repository(github)

  http = HTTParty.get(github)
  json_extract = JSON.parse(http.body)

  starred_repo = json_extract.max_by{|repo| repo["stars"]}

  puts "Name: #{starred_repo["name"]}"
  puts "Description: #{starred_repo["description"]}"
  puts "Number of stars: #{starred_repo["stars"]}"
  puts "URL: #{starred_repo["url"]}"

end

extract_repository("https://api.github.com/users/emilybache/repos")
