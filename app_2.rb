require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts"\n    ▄████████  ▄█  ███▄▄▄▄      ▄██████▄     ▄████████"
puts "   ███    ███ ███  ███▀▀▀██▄   ███    ███   ███    ███"
puts "   ███    ███ ███▌ ███   ███   ███    █▀    ███    █▀"
puts "  ▄███▄▄▄▄██▀ ███▌ ███   ███  ▄███          ███"
puts " ▀▀███▀▀▀▀▀   ███▌ ███   ███ ▀▀███ ████▄  ▀███████████"
puts " ▀███████████ ███  ███   ███   ███    ███          ███"
puts "   ███    ███ ███  ███   ███   ███    ███    ▄█    ███"
puts "   ███    ███ █▀    ▀█   █▀    ████████▀   ▄████████▀"
puts "   ███    ███ \n\n"
puts "   ▄██████▄     ▄████████          ███        ▄█    █▄       ▄████████"
puts "   ███    ███   ███    ███      ▀█████████▄   ███    ███     ███    ███"
puts "   ███    ███   ███    █▀          ▀███▀▀██   ███    ███     ███    █▀"
puts "   ███    ███  ▄███▄▄▄              ███   ▀  ▄███▄▄▄▄███▄▄  ▄███▄▄▄"
puts "   ███    ███ ▀▀███▀▀▀              ███     ▀▀███▀▀▀▀███▀  ▀▀███▀▀▀"
puts "   ███    ███   ███                 ███       ███    ███     ███    █▄"
puts "   ███    ███   ███                 ███       ███    ███     ███    ███"
puts "   ▀██████▀    ███                ▄████▀     ███    █▀      ██████████\n\n"
puts "   ▄█        ▄██████▄     ▄████████ ████████▄     ▄████████"
puts "   ███       ███    ███   ███    ███ ███   ▀███   ███    ███"
puts "   ███       ███    ███   ███    ███ ███    ███   ███    █▀"
puts "   ███       ███    ███  ▄███▄▄▄▄██▀ ███    ███   ███"
puts "   ███       ███    ███ ▀▀███▀▀▀▀▀   ███    ███ ▀███████████"
puts "   ███       ███    ███ ▀███████████ ███    ███          ███"
puts "   ███▌    ▄ ███    ███   ███    ███ ███   ▄███    ▄█    ███"
puts "   █████▄▄██  ▀██████▀    ███    ███ ████████▀   ▄████████▀"
puts "   ▀                      ███    ███\n\n"

puts"  -------------------------------------------------
|      Bienvenue sur Rings of the Lords !       |
|          Parviendras-tu à terrasser           |
|   les deux ennemis mortels de l'humanité ?    |
-------------------------------------------------"

#Game introduction
puts "Nomme ton personnage :"
print "> "
name_human_player = gets.chomp
player_human = HumanPlayer.new(name_human_player)
puts "Voici les caractéristiques de ton personnage :"
puts "#{player_human.name} // #{player_human.life_points} points de vie // arme de niveau #{player_human.weapon_level}\n\n"
puts "────────────────────────────────────────────────────────────\n\n"
puts "Tu entends au loin un bruit ...\nDeux ennemies surgissent à travers l'épaisse couche de brume.\nDeux imposantes figures sombres telles que tu n'en as jamais vu.\nIl s'agit de Morgoth et Sauron.\n"

#Here we initialize enemies
enemies = Array.new
enemies << sauron = Player.new("Sauron")
enemies << morgoth = Player.new("Morgoth")

#Fight loop
while (enemies[0].life_points > 0 || enemies[1].life_points > 0) && player_human.life_points > 0
  puts "\n────────────────────────────────────────────────────────────\n"
  #Prompt a menu where you can choose what will be your next action
  puts "\nQue veux-tu faire ?"
  puts "1: Attaquer ? / 2: Te soigner ? / 3: Changer d'arme ?"
  print "> "
  menu_choice = gets.to_i

  #Selection of player choice of action
  if menu_choice == 1 #Attack
    puts "Qui souhaites-tu attaquer ?"
    puts "1: Sauron / 2: Morgoth"
    print "> "
    ennemy_to_attack = gets.to_i
    if ennemy_to_attack == 1
      player_human.attack(enemies[0])
    else
      player_human.attack(enemies[1])
    end

  elsif menu_choice == 2 #Heal yourself
    player_human.search_health_pack

  else menu_choice == 3 #Upgrade your weapon
    player_human.search_weapon
  end

  enemies.each do |enemy|
    if enemy.life_points > 0
      enemy.attack(player_human)
    end
  end
end
