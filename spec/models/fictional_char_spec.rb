require 'rails_helper'

RSpec.describe FictionalChar, type: :model do
  it "should validate name" do
    fictional_char = FictionalChar.create(
      age: 47,
      enjoys: 'Playing pool and wearing a Kangol hat and impressing chicks',
      image: 'https://i.redd.it/voer03gdaj911.png'
    ) 
    expect(fictional_char.errors[:name]).to_not be_empty
  end
  
  it "should validate age" do
    fictional_char = FictionalChar.create(
      name: 'Date Mike',
      enjoys: 'Playing pool and wearing a Kangol hat and impressing chicks',
      image: 'https://i.redd.it/voer03gdaj911.png'
    ) 
    expect(fictional_char.errors[:age]).to_not be_empty
  end

  it "should validate enjoys" do
    fictional_char = FictionalChar.create(
      name: 'Date Mike',
      age: 47,
      image: 'https://i.redd.it/voer03gdaj911.png'
    ) 
    expect(fictional_char.errors[:enjoys]).to_not be_empty
  end

  it "should validate image" do
    fictional_char = FictionalChar.create(
      name: 'Date Mike',
      age: 47,
      enjoys: 'Playing pool and wearing a Kangol hat and impressing chicks'
    ) 
    expect(fictional_char.errors[:image]).to_not be_empty
  end   

  it "should validate enjoys is greater than 10 characters long" do
    fictional_char = FictionalChar.create(
      name: 'Date Mike',
      age: 47,
      enjoys: 'Playing',
      image: 'https://i.redd.it/voer03gdaj911.png'
    ) 
    expect(fictional_char.errors[:enjoys]).to_not be_empty
  end
end
