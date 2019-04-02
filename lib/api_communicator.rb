require 'rest-client'
require 'json'
require 'pry'


def get_character_movie_urls_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  response_hash["results"].each do |people|
    if people["name"].downcase == character_name
      return people["films"] 
      #binding.pry
    end 
  end 
end

def get_character_movie_info_from_api(film_urls)
  response_string = RestClient.get('http://www.swapi.co/api/films/')
  response_hash = JSON.parse(response_string)

  film_info_hash = []
  film_urls.each do |film_url|
    response_hash["results"].each do |film|
      if film["url"] == film_url
        film_info_hash << film
        #binding.pry
      end 
    end 
  end 
  film_info_hash
end 

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  titles = films.map do |film_info|
    #binding.pry
    "#{film_info["episode_id"]} - #{film_info["title"]}"
  end 

  puts titles.sort

end

def show_character_movies(character)
  film_urls = get_character_movie_urls_from_api(character)
  film_info = get_character_movie_info_from_api(film_urls)
  print_movies(film_info)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
