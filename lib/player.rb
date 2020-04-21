
class Player
  attr_accessor :name, :life_points

  def initialize(name) #j'initialise mon objet en lui imputant des variables d'instance nom et pts de vie, mais lorsqu'on initalise on peut seulement rentrer un nom
    @name = name
    @life_points = 10
  end

  def show_state#affiche l'état de l'objet player
    puts "#{name} a #{@life_points} points de vie"
  end


def gets_damage(lost_points) #appliquer les pertes de vies"
    @life_points -= lost_points
    if @life_points < 1 #au lien de faire < ou = à 0 cela revient à faire strictement <1
      return  "Le joueur #{name} a été tué !"
    end
end 
      

def compute_damage #attribuer une perte aléatoire de vies
    return rand(1..6)
  end

def attacks(player2) #lancement d'une attaque
  puts "#{@name} attaque #{player2.name} "
  damage = compute_damage
  puts "Il lui inflige #{damage} points de dommages !"
  if player2.life_points - damage < 1
      puts player2.gets_damage(damage)
  end 
  player2.life_points = player2.life_points - damage #condition pour que le calcul des points s'effecture correctement
    return player2.show_state
  end

class HumanPlayer < Player #ma deuxième classe
  attr_accessor :weapon_level#je veux ajouter un attribut weaper

  def initialize(name)#je rentre les mêmes variablesque pour la classe mère
  super(name)
    @life_points = 100 #j'utilise super pour que les changement ne s'appliquent qu'à la classe fille Human
    @weapon_level = 1
  end

  def show_state
    super 
    puts " et une arme de niveau #{@weapon_level}"#avec super je réutilise la phrase de base et j'y ajoute le complément sur le niveau d'arme
  end


  def compute_damage #manouvelle méthode doit multiplier les dégâts
    super * @weapon_level #idem, je repars donc de la méthode de la classe mère grâce à super et je multiplie par weapon_level
  end #dégâts compris entre [@weapon_level] et [6 x @weapon_level]
    
  def search_weapon
    puts "lance un dé en appuyant sur la touche entrée" 
    gets.chomp #pour laisser un intervalle d'intéraction avec le joueur
    new_level_weapon = rand(1..6) #lancement de  mon dé
    puts "Tu as trouvé une arme de niveau #{new_level_weapon}"
      if new_level_weapon > @weapon_level then @weapon_level = new_level_weapon # cela vaut-il le coup de garder mon arme ?si ma nouvelle arme a plus de force, je la substitue à l'ancienne
        puts "Youhou ! Elle est meilleure qui ton arme actuelle : take the power!"
      else puts "Oupsi... Elle n'est pas mieux que ton arme actuelle, tu gardes donc l'actuelle..."
      end 
  end 


  def search_health_pack
    puts "lance un dé en appuyant sur la touche entrée" 
    gets.chomp
    pack_life = rand(1..6)
      if pack_life == 1 
        puts "Tu n'as rien trouvé..."
      elsif ( pack_life <= 5 ) 
        @life_points = @life_points + 50
        puts "Bravo tu as trouvé un pack de +50 points de vie!"
      else @life_points = @life_points + 80 #ici le résultat du dé est forcément 6
        puts "Waoww, tu as trouvé un pack de +80 points de vie!"
      end 

      if @life_points > 100
        @life_points = 100 
        else @life_points
      end 

    end 
end

end  
