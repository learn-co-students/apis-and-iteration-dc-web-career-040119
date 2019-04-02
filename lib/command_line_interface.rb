def welcome
  # puts out a welcome message here!
  puts "Welcome to the Star Wars movie database finder thing - enjoy!"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp.downcase
  puts input
  return input
end
