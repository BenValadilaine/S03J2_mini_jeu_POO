class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    return "#{@life_points}"
  end

  def gets_damage(damages)
    self.life_points -= damages
  end

  def attack(attacked_player)
    print "\n#{self.name} attaque #{attacked_player.name} et "
    #Getting number of damages from compute_damage methode ->
    damages_received = compute_damage
    #Dealing damages ->
    attacked_player.gets_damage(damages_received)
    #Displaying results of the attack ->
    puts "inflige #{damages_received} dégât(s)."
    if attacked_player.life_points > 0
      puts "#{attacked_player.name} a #{attacked_player.show_state} points de vie."
    else
      puts "#{attacked_player.name} est mort !"
    end
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @life_points = 100
    @weapon_level = 1
    @name = name
  end

  def show_full_status
    return "#{self.name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
  end


  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    if new_weapon_level > weapon_level
      @weapon_level = new_weapon_level
      puts "Cool ! L'arme que tu viens de trouver est de niveau #{new_weapon_level}.\nElle plus puissante que l'ancienne, tu la gardes !"
    else
      puts "C'est balo, cette nouvelle arme n'est pas meilleure que l'ancienne, tu la balances au loin."
    end
  end


  def search_health_pack
    searching = rand(1..6)
    p searching
    if searching == 1
      puts "Tu n'as rien trouvé ..."
    elsif searching >= 2 && searching <= 5
      puts "Bravo tu as trouvé un pack de +50 de points de vie !"
      if @life_points + 50 >= 100
        @life_points = 100
      else
        @life_points = @life_points + 50
      end
      puts "Tu as maintenant #{@life_points} points de vie."
    else
      puts "Waow tu as trouvé un pack de +80 de points de vie !!"
      if @life_points + 80 >= 100
        @life_points = 100
      else
        @life_points = @life_points + 80
      end
      puts "Tu as maintenant #{@life_points} points de vie."
    end
  end
end
