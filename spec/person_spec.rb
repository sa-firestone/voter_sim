require "./person.rb"

describe Person do
    
    it "verifies that it is a person" do
        person = Person.new("John Doe")
        expect(person).to be_a(Person)
    end
    
    it "can recall its name" do
        person = Person.new("John Doe")
        expect(person.name).to eq("John Doe")
    end
    
end