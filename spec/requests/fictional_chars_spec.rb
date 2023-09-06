require 'rails_helper'

RSpec.describe "FictionalChars", type: :request do
  describe "GET /index" do
  it "gets the list of fictional characters" do
  FictionalChar.create(
    {
    name: 'Date Mike',
    age: 47,
    enjoys: 'Playing pool and wearing a Kangol hat and impressing chicks',
    image: 'https://i.redd.it/voer03gdaj911.png'
    }
    )

    get '/fictional_chars' 

    fictional_char = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    expect(fictional_char.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a fictional_char" do
      fictional_char_params = {
      fictional_char:  {
        name: 'Date Mike',
        age: 47,
        enjoys: 'Playing pool and wearing a Kangol hat and impressing chicks',
        image: 'https://i.redd.it/voer03gdaj911.png'
      }
    }
    post '/fictional_chars', params: fictional_char_params
    expect(response).to have_http_status(200)
    fictional_char = FictionalChar.first
    expect(fictional_char.name).to eq 'Date Mike'
    expect(fictional_char.age).to eq 47
    expect(fictional_char.enjoys).to eq 'Playing pool and wearing a Kangol hat and impressing chicks'
    end
  end


  # Validations Requests Specs
  describe "cannot create a fic char without valid attributes" do 
  it "does not create a fic char without a name" do
      fictional_char_params = {
      fictional_char: {
       age: 47,
        enjoys: 'Playing pool and wearing a Kangol hat and impressing chicks',
        image: 'https://i.redd.it/voer03gdaj911.png'
         }
        }
        post '/fictional_chars', params: fictional_char_params
      expect(response.status).to eq 422
      fictional_char = JSON.parse(response.body)
      expect(fictional_char['name']).to include "can't be blank"
      end
    end
    describe "cannot create a fic char without valid attributes" do 
      it "does not create a fic char without an age" do
          fictional_char_params = {
          fictional_char: {
           name: 'Date Mike',
            enjoys: 'Playing pool and wearing a Kangol hat and impressing chicks',
            image: 'https://i.redd.it/voer03gdaj911.png'
             }
            }
            post '/fictional_chars', params: fictional_char_params
          expect(response.status).to eq 422
          fictional_char = JSON.parse(response.body)
          expect(fictional_char['age']).to include "can't be blank"
          end
        end
        describe "cannot create a fic char without valid attributes" do 
          it "does not create a fic char without enjoys" do
              fictional_char_params = {
              fictional_char: {
               name: 'Date Mike',
               age: 47,
            
                image: 'https://i.redd.it/voer03gdaj911.png'
                 }
                }
                post '/fictional_chars', params: fictional_char_params
              expect(response.status).to eq 422
              fictional_char = JSON.parse(response.body)
              expect(fictional_char['enjoys']).to include "can't be blank"
              end
            end
            describe "cannot create a fic char without valid attributes" do 
              it "does not create a fic char without an image" do
                  fictional_char_params = {
                  fictional_char: {
                   name: 'Date Mike',
                   age: 47,
                   enjoys: 'Playing pool and wearing a Kangol hat and impressing chicks'
                     }
                    }
                    post '/fictional_chars', params: fictional_char_params
                  expect(response.status).to eq 422
                  fictional_char = JSON.parse(response.body)
                  expect(fictional_char['image']).to include "can't be blank"
                  end
                end
end
