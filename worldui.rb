#              **LIST_OF_FIND_SECTIONS**

#         person---------------------(line 49)
#         politician-----------------(line 55)
#         voter----------------------(line 71)
#         general--------------------(line 91)
#         create_general-------------(line 103)
#         update_general-------------(line 126)
#         update_voter---------------(line 149)
#         update_politician----------(line 178)
#         delete---------------------(line 207)
#         instance_start-------------(line 230)

require "./world.rb"

class WorldUi 

    
    def initialize 
        @world = World.new
    end

    def ui 
        opening_lines()
        action = gets.chomp

        case action.downcase
        when "c"
            puts "(P)olitician or (V)oter?"
            person = gets.chomp 
            voter_politician_create(person)
        when "l"
            puts @world.list_politicians()
            puts @world.list_voters()
            restart()
        when "u"
            puts "(P)olitician or (V)oter?"
            entity = gets.chomp
            voter_politician_update(entity)
        when "d"
            puts "Whom would you like to delete?"
            voter_politician_delete(person)
        when "q"
            puts "Goodbye"
        else 
            restart()
        end
    end

#person

    def ask_name
        puts "name?"
    end

#politician

    def pick_party
        party = gets.chomp
        case party.downcase
        when "d"
            return "Democrat"
        when "r"
            return "Republican"
        when "i"
            return "Independent"
        else
            restart()
        end
    end

#voter

    def pick_politics
        politics = gets.chomp()
        case politics.downcase 
        when "l"
            return "Liberal"
        when "c"
            return "Conservative"
        when "t"
            return "Tea Party"
        when "s"
            return "Socialist"
        when "n"
            return "Neutral"
        else 
            restart()
        end
    end

#general

    def opening_lines 
        puts "Hello, and welcome to the Voter Simulator!"
        puts "What would you like to do today?"
        puts "(C)reate, (L)ist, (U)pdate, (D)elete, (Q)uit"
    end

    def restart
        ui()
    end

#create_general

    def voter_politician_create(person)
        case person.downcase
        when "v"
            ask_name()
            name = gets.chomp
            puts "Is this voter (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral?"
            politics = pick_politics()
            @world.create_voter(name, politics)
            restart()
        when "p"
            ask_name()
            name = gets.chomp
            puts "Is this politician (D)emocrat, (R)epublican or (I)ndependent?"
            party = pick_party() 
            @world.create_politician(name, party)
            restart()
        else 
            restart()
        end
    end

#update_general

    def voter_politician_update(entity)
        case entity.downcase 
        when "v"
            ask_name()
            name = gets.chomp
            category = update_what_category_voter()
            val = new_value_voter(category)
            @world.update_voter(name, category, val)
            restart()
        when "p"
            ask_name()
            name = gets.chomp
            category = update_what_category_pol()
            val = new_value_pol(category)
            @world.update_politician(name, category, val)
            restart()
        else
            restart()
        end
    end

#update_voter

    def update_what_category_voter
        puts "Would you like to update (N)ame or (P)olitics?"
        choice = gets.chomp
        case choice.downcase 
        when "n"
            return "name"
        when "p"
            return "politics"
        else 
            restart()
        end
    end

    def new_value_voter(x) 
        puts "What would you like the new value to be?"
        case x.downcase
        when "name"
            val = gets.chomp 
            return val 
        when "politics"
            puts "Is this voter (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral?"
            pick_politics()
        else 
            restart()
        end
    end

#update_politician

    def update_what_category_pol
        puts "Would you like to update (N)ame or (P)arty?"
        choice = gets.chomp
        case choice.downcase 
        when "n"
            return "name"
        when "p"
            return "party"
        else 
            restart()
        end
    end

    def new_value_pol(x) 
        puts "What would you like the new value to be?"
        case x.downcase
        when "name"
            val = gets.chomp 
            return val 
        when "party"
            puts "(D)emocrat, (R)epublican or (I)ndependent"
            pick_party()
        else 
            restart()
        end
    end

#delete

    def voter_politician_delete(person)
        ask_name()
        name = gets.chomp
        confirm()
        confirmation = gets.chomp 
        if confirmation.downcase == "y" 
            @world.delete_voter(name)
            @world.delete_politician(name)
        else
            restart()
        end
        restart()
    end

    def confirm
        puts "Are you sure"
        puts "(Y)es or (N)o"
    end

end

#instance_start

world = WorldUi.new()
world.ui()