require "./person.rb"
require "./voter.rb"
require "./politician.rb"

class World
    attr_accessor :voters, :politicians
    
    def initialize
        @voters = []
        @politicians = []
    end
    
    def create_voter(name, politics)
        person = Voter.new(name, politics)
        @voters.push(person)
    end
    
    def create_politician(name, party)
        person = Politician.new(name, party)
        @politicians.push(person)
    end
    
    def list_voters
        result = ""
        @voters.each do |v|
            result += "Voter, #{v.name}, #{v.politics}"
        end
        result
    end
    
    def list_politicians
        result = ""
        @politicians.each do |p|
            result +=  "Politician, #{p.name}, #{p.party}"
        end
        result
    end

    def list_voters
        result = ""
        @voters.each do |v|
            result += "Voter, #{v.name}, #{v.politics}"
        end
        result
    end
    
    def update_politician(name, val_to_change, new_val)
        @politicians.each do |p|
            if p.name == name
                case val_to_change
                when "name"
                    p.name = new_val
                when "party"
                    p.party = new_val
                end
            else
                return "That person is not in our records"
            end
        end
    end
    
    def update_voter(name, val_to_change, new_val)
        @voters.each do |v|
            if v.name == name
                case val_to_change
                    when "name"
                        v.name = new_val
                    when "politics"
                        v.politics = new_val
                end
            else
                return "That person is not in our records"
            end
        end
    end
        
    def delete_politician(name)
        @politicians.each do |p|
            if p.name == name
                @politicians.delete(p)
            else
                return "That voter is not in our records"
            end
        end
    end
    
    def delete_voter(name)
        @voters.each do |v|
            if v.name == name
                @voters.delete(v)
            else
                return "That voter is not in our records"
            end
        end
    end
    
end