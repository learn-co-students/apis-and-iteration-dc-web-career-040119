require 'rest-client'
require 'json'
require 'pry'


def parse_data
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  JSON.parse(response_string)
end

def get_character_data(character_name)
  parse_data["results"].find do |character_data|
    character_data["name"].downcase == character_name
  end
end

def get_character_movies(character_name)
  character_data = get_character_data(character_name)
  character_data["films"]
end

def get_movie_data(character_name)
  film_arr = get_character_movies(character_name)
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
  films = get_movie_data(character)
  print_movies(films)
end
