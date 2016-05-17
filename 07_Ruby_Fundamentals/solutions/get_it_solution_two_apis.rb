#1 - Pull the json from the reddit API via http://www.reddit.com/.json
  # - http://mashable.com/stories.json (homework)
#2 - Parse it using the JSON library
#3 - Find the stories based on techniques used in the code_along (max of 25 provided)
#4 - Create a new story hash out of each story with the following keys :title, :upvotes and :category
    #title, #category and #upvotes may not be the names use
#5 - Add each story to an array
#6 - Print each story from the array on your "Front Page"
#7 - BONUS ### create an 'csv' file using the api data & Ruby's CSV library
     # -> http://ruby-doc.org/stdlib-2.2.2/libdoc/csv/rdoc/CSV.html
         #title, upvote, category are the required columns

require 'pry'  #debugging tool
require 'rest-client' #library that faciltates http requests
require 'json' #tranforms a string response into 'json'

def connect_to_api(url, api_provider)
  response = RestClient.get(url)
  json_response = JSON.parse(response)
  find_stories(json_response, api_provider)
end

def find_stories(response, api_provider)
  if api_provider == "reddit"
    find_reddit_stories(response, api_provider)
  elsif api_provider == "mashable"
    find_mashable_stories(response, api_provider)
  else
    puts "Not a supported provider"
  end
end

def find_reddit_stories(response, api_provider)
  stories = response["data"]["children"]
  puts "*******Reddit has blessed us with #{stories.count} stories *******"
  print_stories(stories, api_provider)
end

def find_mashable_stories(response, api_provider)
  stories = response["hot"]
  puts "*******Mashable has blessed us with #{stories.count} hot stories *******"
  print_stories(stories,api_provider)
end

def print_stories(stories, api_provider)
  stories.each do |story|
    story = create_story_hash(story, api_provider)
    puts "Title: #{story[:title]}. Category: #{story[:category]}. Upvotes: #{story[:upvotes]} upvotes. API Source: #{story[:provider]}"
  end
end

def create_story_hash(story, api_provider)
  if api_provider == "reddit"
    {title: story["data"]["title"], upvotes: story["data"]["ups"],  category: story["data"]["subreddit"], provider: api_provider}
  elsif api_provider == "mashable"
    {title: story["title"], upvotes: story["shares"]["total"],  category: story["channel"], provider: api_provider}
  else
    puts "No hash created"
  end
end

reddit_url = "http://www.reddit.com/.json"
mashable_url =  "http://mashable.com/stories.json"

connect_to_api(reddit_url, "reddit")
connect_to_api(mashable_url, "mashable")
