# /dice.rb

require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

def roll_result(number_of_dice, number_of_sides_per_die)

  @number_of_dice = number_of_dice 
  @number_of_sides_per_die = number_of_sides_per_die

  @rolls = []

  number_of_dice.times do
    die = rand(1..number_of_sides_per_die)

    @rolls.push(die)
  end

  erb(:rolls)

end

#-----------------------------------------------

get("/") do
  erb(:elephant)
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
