require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#SUPPRIMER CES LIGNES AVANT LE PUSH FINAL
#SUPPRIMER CES LIGNES AVANT LE PUSH FINAL
ben = Player.new("Ben")
nora = Player.new("Nora")
#SUPPRIMER CES LIGNES AVANT LE PUSH FINAL
#SUPPRIMER CES LIGNES AVANT LE PUSH FINAL

def intro(nora, ben)
  puts "À ma gauche #{nora.name} avec #{nora.show_state} points de vie."
  puts "À ma droite #{ben.name} avec #{ben.show_state} points de vie."
  puts "\nPassons à la phase d'attaque !"
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

play(ben, nora)

#End of code
