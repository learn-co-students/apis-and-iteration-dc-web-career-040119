require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)

  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  character_hash= response_hash["results"].find do |character_data |
    character_data["name"] == character_name
  end

  film_arr = character_hash["films"]


  film_arr.map do |film|
    film_url_response= RestClient.get(film)
    JSON.parse(film_url_response)
  end
end

def print_movies(films)
  films.each_with_index do |film, index|
    puts "#{index + 1}. #{film["title"]}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
