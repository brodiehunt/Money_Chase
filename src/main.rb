# Main file which is run to play the application
require 'ruby2d'
require 'tty-prompt'
require 'faker'
require 'colorize'
require_relative './game.rb'
require_relative './coin.rb'
require_relative './trump.rb'
require_relative './prompt.rb'
require_relative './enemy.rb'
prompt = Display.new
$n = false
if ARGV.empty? || ARGV[0] == 'name'
  nil
else 
  prompt.username = ARGV[0]
end
loop do
  system 'clear'
  puts '
         __  ___                          ________
        /  |/  /___  ____  ___  __  __   / ____/ /_  ____ _________
       / /|_/ / __ \/ __ \/ _ \/ / / /  / /   / __ \/ __ `/ ___/ _ \
      / /  / / /_/ / / / /  __/ /_/ /  / /___/ / / / /_/ (__  )  __/
     /_/  /_/\____/_/ /_/\___/\__, /   \____/_/ /_/\__,_/____/\___/
                             /____/'.colorize(:blue)
  menu = prompt.select("what would you like to do #{prompt.username}?",
                       prompt.options_array(prompt.username))
  if prompt.menu_input(menu) == 'Create Username' || prompt.menu_input(menu) == 'Change username'
    choice = prompt.select('What type of username would you like?', %w[Random Custom])
    if choice == 'Random'
      prompt.username = Faker::FunnyName.name
    else
      username = prompt.ask('Please enter your username!', required: true)
      prompt.username = username
    end
  elsif prompt.menu_input(menu) == 'How to Play'
    puts "Money Chase is a adaptation of the game snake. Collect the coins\n
         but stay away from the evil read squares. To control the trump use\n
         the keys w,s,a,d for the movements up, down, left, right respectively.\n
         Press any key to start the game when you enter the window. Press 't' to\n
        quit at any time, or 'r' to restart at anytime."
    sleep 20
  elsif prompt.menu_input(menu) == 'Quit'
    break
  elsif prompt.menu_input(menu) == 'Play'
    require_relative './game_window.rb'
    break if $n == true
  end
end
