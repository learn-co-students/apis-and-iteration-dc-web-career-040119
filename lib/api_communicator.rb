require "rest-client"
require "json"
require "pry"

def get_character_film_urls(character)
  query_url = "http://www.swapi.co/api/people/"
  loop do
    response_string = RestClient.get(query_url)
    response_hash = JSON.parse(response_string)
    people_data = response_hash["results"]
    people_data.each do |person|
      if person["name"].downcase.start_with?(character)
        return person["films"]
      elsif response_hash["next"].nil?
        return nil
        break
      else
        query_url = response_hash["next"]
      end
    end
  end
end

def get_film_titles(film_urls)
  response_string = RestClient.get("http://www.swapi.co/api/films/")
  response_hash = JSON.parse(response_string)
  film_data = response_hash["results"]
  titles = []
  film_urls.each do |film_url|
    film_data.each do |film|
      titles << film["title"] if film["url"] == film_url
    end
  end
  titles
end

def show_character_movies(character)
  film_urls = get_character_film_urls(character)
  if film_urls.nil?
    puts "Error: could not find any characters with this name"
  else
    titles = get_film_titles(film_urls)
    puts titles
  end
end
