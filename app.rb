require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def intro(nora, ben)
  puts "Les deux combattant.e.s entrent sur le ring !!"
  puts "À ma gauche #{nora.name} avec #{nora.show_state} points de vie."
  puts "À ma droite #{ben.name} avec #{ben.show_state} points de vie."
  puts "\nPassons à la phase d'attaaaaaque !"
end

def fight(ben, nora)
  while nora.life_points > 0 && ben.life_points >0
    puts nora.attack(ben)
    break if nora.life_points <= 0 || ben.life_points <= 0
    puts ben.attack(nora)
  end
end

def play(ben,nora)
  intro(ben,nora)
  fight(ben,nora)
end

ben = Player.new("Ben")
nora = Player.new("Nora")

play(ben,nora)
