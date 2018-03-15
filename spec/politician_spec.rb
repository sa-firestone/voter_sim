require "./politician.rb"

describe Politician do

    it "reports that it is a politician" do
        person = Politician.new("Jim Doe", "Democrat")
        expect(person).to be_a(Politician)
    end
    
    it "can tell its name" do
        person = Politician.new("Jim Doe", "Democrat")
        expect(person.name).to eq("Jim Doe")
    end
    
    it "can tell its party affiliation" do
        person = Politician.new("Jim Doe", "Democrat")
        expect(person.party).to eq("Democrat")
    end
    
end