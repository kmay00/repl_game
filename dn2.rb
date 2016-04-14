
desert_array = Array.new(rand(8..10), 0)

dunes = rand(4..8)
oasis = rand(1..3)
sandstorm = rand(1..2)

dunes.times { desert_array << 1 }
oasis.times { desert_array << 2 }
sandstorm.times { desert_array << 3 }

desert_array.shuffle!
$game_length = desert_array.length

# runs the intro text
def intro
  puts "*" * 100
  puts " " * 25 + "Greetings weary traveler! Welcome to Desert Nights!"
  puts "*" * 100
  puts
  puts "If you can survive the \"Desert of Confusion\" the world has great opportunities in store for you."
  puts "Please pay attention closely. The only thing that matters is that you keep moving forward."
  puts
  puts "-" * 100
end

# desert escaped so run the genie end game
def end_game
  puts "You finally reach the coast and spot a glistening lamp in sand. The waves almost wash it away, but you get there first."
  puts
  puts "As soon as you pick it up a genie appears."
  puts
  puts "The genie says, \"Congratulations traveler! I'm the great genie Edocnyw! I've been watching you on your journey and have been impressed with your progress.\""
  puts "Edocnyw continues, \"You're very persistent! Your tremendous effort will carry you even further in the future, but first you must pass my test.\""
  puts "\"Now I want to see if you were paying attention. If you can prove that you are both persistent and attentive I will grant you wishes happily ever after!\""
  puts 
  puts "Edocnyw asks: \"How many moves did it take you to escape the desert?\""
  #puts $game_length
  game_length_guess = gets.chomp.to_i
  if $game_length == game_length_guess
    puts "The genie exclaims \"Congratulations. You're attentive too. You've passed my test and now I am certain you will succeed."
    puts "Please tell me your name so that you can be honored forever in my .txt file."
    victor_name = gets.chomp
    #File.write('/path/to/file', 'Some glorious content')
    #roll_credits()
  else
    puts "The genie looks at you dissappointedly. It had such high hopes. If you try again perhaps it won't banish you to the retail realm."
  end
end

# write a description based on the array value
def describe_scenery(terrain)
  case terrain
  when 0 
    [
    "It's just a lot of sand. How hard can it be?",
    "You think you can see a tree in the distance, but you're not sure.",
    "The heat is scorching. There's nothing out here.",
    "It's night time and you've never seen so many stars. The cold bites into you.",
    "It's just blue sky and gold sand for an infinity. You wonder if your family would recognize you still.", 
    "Are you going in circles? There aren't any landmarks.",
    "A few buzzards circle above. Are they here for you?"
    ].shuffle.pop
  when 1
    [
    "You're at the peak of the highest dune you've ever seen. The sun beats down on you.",
    "You struggled to crest the hill, but the view was worth it. You think you can smell the ocean from here.",
    "The sand shifts beneath your feet. You continue your exhausting climb up the dune.",
    "You can see for miles in every direction from the giant dune, but theres nothing noteworthy to be seen."
    ].shuffle.pop
  when 2
    [
    "You come across the most lush oasis. The monotony of the surrounding area weighs on your mind. You're not sure if you should leave.",
    "An oasis sustains a tiny pocket of life in the vast expanse of desert. You drink until your thirst is quenched. You think you'll make it."
    ].shuffle.pop
  when 3
    [
    "You come across a camp of nomads. None of them speak English. They only speak Ruby. They offer you water and encouragement.",
    "A vicious sandstorm impedes your progress. The wind whips sand into your face. You're not sure if you can continue."
    ].shuffle.pop
  else
    "Something messed up. This shouldn't happen"
  end
end

# ask the user for their choice
def player_move
  puts "Enter your next move. Options are walk or rest."
  input = gets.chomp.downcase
  #until ["ride", "walk", "rest"].include? input
  #  player_move
  #end
end

# print the current player condition
def player_condition
  [
  "You're feeling OK",
  "You're feeling OK, but your lips are cracked.",
  "You're feeling OK, but your sunburn is getting worse",
  "You're feeling OK",
  "You're moderately thirsty. You must find more water soon.",
  "You're extremely dehydrated. You must get something drink.",
  "You're exhausted. You should rest.",
  "You're thirsty and tired."
  ].shuffle.pop
end


intro

# until the desert is escaped repeat the description and ask the player for options
desert_array.each do |x|
  puts
  puts describe_scenery(x)
  puts player_condition
  if player_move == "rest"
    redo
  end
end

puts "*" * 100
end_game