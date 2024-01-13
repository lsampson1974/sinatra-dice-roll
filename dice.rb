# /dice.rb

require "sinatra"
require "sinatra/reloader"

def roll_result(number_of_dice, number_of_sides_per_die)

  if number_of_dice > 1 
    demonstrative_pronoun = "these"
  else
    demonstrative_pronoun = "this"
  end

  roll_string = " "

  dice_total = 0

  for num_dice in 1..number_of_dice do  
    
      dice_roll = rand(1..number_of_sides_per_die) 
       roll_string += " #{dice_roll} "

      dice_total += dice_roll

  end

  roll_message = " "

  if number_of_dice > 1    
      roll_message = "Total of the dice rolls : #{dice_total}"
  end

  "<h1> #{number_of_dice}d#{number_of_sides_per_die} </h1>

  <p></p><p>You rolled #{demonstrative_pronoun} : </p>
  
  <p> #{roll_string} </p><p></p>
  
  <p> #{roll_message} </p>
  
  <p></p><p>Refresh to roll again.</p>
  <p></p><p><a href='/diceroll'>Home</a></p>"

end

#-----------------------------------------------

get("/") do
  "Hello World"
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/diceroll") do
  "<h1>Dice Roll</h1>
  <p></p>
  <ul>
    <li><a href="'/dice/2/6'">Roll two 6 sided dice</a></li>
    <li><a href="'/dice/2/10'">Roll two 10 sided dice</a></li>
    <li><a href="'/dice/1/20'">Roll one 20 sided dice</a></li>
    <li><a href="'/dice/5/4'">Roll five 4 sided dice</a></li>
  </ul>"

end

#-----------------------------------------------

get("/dice/2/6") do
  roll_result(2, 6)
end

get("/dice/2/10") do
  roll_result(2, 10)
end

get("/dice/1/20") do
  roll_result(1, 20)
end

get("/dice/5/4") do
  roll_result(5, 4)
end
