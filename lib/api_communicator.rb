require 'rest-client'
require 'json'
require 'pry'



def parse_array_elements(array_to_parse)
  array_to_parse.collect do |parse|
    JSON.parse(parse)
  end
  #create new array
  #iterate over each array element
  #json.parse each arrau element
end



def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
    response_hash["results"].each do |items|
      if items["name"] == character_name
        arr = []
          items["films"].each do |web|
            arr << RestClient.get(web)
          end
        return parse_array_elements(arr)
      end
    end
end

      #   arr2 = []
      #   arr.each do |parse|
      #     arr2 << JSON.parse(parse)
      #   end
      # return arr2


# iterate over the response hash to find the collection of `films` for the given `character`

# collect those film API urls, make a web request to each URL to get the info for that film


  # return value of this method should be collection of info about each film. i.e. an array of hashes in which each hash reps a given film


  # this collection will be the argument given to `print_movies` and that method will do some nice presentation stuff like puts out a list of movies by title. Have a play around with the puts with other info about a given film.


#get_character_movies_from_api("Luke Skywalker")

def print_movies(films)
films.each do |movie|
    puts movie["title"]
  end
  # some iteration magic and puts out the movies in a nice list
end



# character_hashes = get_character_movies_from_api("Luke Skywalker")
# print_movies(character_hashes)


def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS
# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
