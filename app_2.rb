require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "
		------------------------------------------------
		|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
		|Le but du jeu est d'être le dernier survivant !|
		-------------------------------------------------

____________QUI SERA A LA HAUTEUR ? JOSE vs JOSIANE _________
"

puts "Quel est ton nom de gladiateur ?"
@name = gets.chomp.to_s
user = HumanPlayer.new(@name) #je veux que mon utilisateur soit considéré correctement comme un humain

#creation des tableaux d'ennemis, tabl pr manipuler plus d'ennemis dans le futur
enemies = []
player1 = Player.new("Josiane")#je reprends les mêmes tenants que dans app.rb
player2 = Player.new("José")
enemies << player1 #je mets tous mes combattants dans mon array
enemies << player2


	while  (user.life_points > 0) && ( player1.life_points > 0 || player2.life_points >0 )  
    
    user.show_state

	puts "\n"
	    puts "Quelle action veux-tu effectuer?"
	    puts "tape - a - pour chercher une meilleure arme"
	    puts "tape - s - pour chercher à te soigner"
	puts "\n"   
	    puts "Pour attaquer un joueur :"
	puts "\n"
	    print "Tape - 0 - pour combattre Josiane. "
	    puts "#{player1.show_state}" 
	    print "Tape - 1 - pour combattre José. "
	    puts "#{player2.show_state}" 
	    user_input = gets.chomp.to_s 
	 


	    case user_input #si on tape
	    	when "a"
	    		user.search_weapon
	    	when "s"
	    		user.search_health_pack
	    	when "0"
	    		user.attacks(player1)
	    	when "1"
	    		user.attacks(player2)
	    end
	puts "\n"

	    puts "Les autres joueurs t'attaquent !" if player1.life_points > 0 || player2.life_points > 0
	    enemies.each{|player|
	    	         player.attacks(user) if player.life_points > 0
	                 } 
	    puts ""
	    end 


(user.life_points > 0)? (puts "BRAVO TU AS GAGNEEEEE !") : (puts "Nannnn ! T'as perdu ...")





