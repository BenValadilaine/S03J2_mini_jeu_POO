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
    print "#{self.name} attaque #{attacked_player.name} et "
    #Getting number of damages from compute_damage methode ->
    damages_received = compute_damage
    #Dealing damages ->
    attacked_player.gets_damage(damages_received)
    #Displaying results of the attack ->
    print "inflige #{damages_received} dégât(s). #{attacked_player.name} a #{attacked_player.show_state} points de vie."
    #If someone died, it is displayed with death method->
    return death(attacked_player)
  end

  def compute_damage
    return rand(1..6)
  end

  def death(attacked_player)
    if attacked_player.life_points > 0
      return
    elsif
      attacked_player.life_points <= 0
      return "\n#{attacked_player.name} est mort !"
    end
  end
end
