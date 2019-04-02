def welcome
  # puts out a welcome message here!
  puts "Welcome to to our webpage"
end

def get_character_from_user
  puts "Please enter a character name"
  input = gets.chomp
  return input.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
