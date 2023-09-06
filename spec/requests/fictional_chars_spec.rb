require 'rails_helper'

RSpec.describe "FictionalChars", type: :request do
  describe "GET /index" do
    it "gets the list of fictional characters" do
      FictionalChar.create(
        name: 'Date Mike',
        age: 47,
        enjoys: 'Playing pool and wearing a Kangol hat and impressing chicks',
        image: 'https://i.redd.it/voer03gdaj911.png'
      )

      get '/fictional_chars'

      fictional_chars = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(fictional_chars.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a fictional_char" do
      fictional_char_params = {
        fictional_char: {
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

    it "does not create a fictional_char without valid attributes" do
      invalid_fictional_char_params = {
        fictional_char: {
          age: 47,
          enjoys: 'Playing pool and wearing a Kangol hat and impressing chicks',
          image: 'https://i.redd.it/voer03gdaj911.png'
        }
      }

      post '/fictional_chars', params: invalid_fictional_char_params

      expect(response.status).to eq 422
      fictional_char = JSON.parse(response.body)
      expect(fictional_char['name']).to include "can't be blank"
    end
  end
  describe "PATCH /update" do
   it "updates a char" do
    fictional_char_params = {
      fictional_char: {
        name: 'Date Mike',
        age: 47,
        enjoys: 'Playing pool and wearing a Kangol hat and impressing chicks',
        image: 'https://i.redd.it/voer03gdaj911.png'
      }
    }
      post '/fictional_chars', params: fictional_char_params
      fictional_char = FictionalChar.first

      updated_fictional_char_params = {
        fictional_char: {
          name: 'Date Mike',
          age: 47,
          enjoys: 'Playing pool and wearing a Kangol hat and impressing chicks',
          image: 'https://i.redd.it/voer03gdaj911.png'
        }
      }
      patch "/fictional_chars/#{fictional_char.id}", params: updated_fictional_char_params
      updated_fictional_char = FictionalChar.find(fictional_char.id)
      expect(response).to have_http_status(200)
      expect(updated_fictional_char.age).to eq 47
    end
  end
  describe "DELETE /destroy" do 
    it "deletes a char" do 
      fictional_char_params = {
        fictional_char: {
          name: 'Date Mike',
          age: 47,
          enjoys: 'Playing pool and wearing a Kangol hat and impressing chicks',
          image: 'https://i.redd.it/voer03gdaj911.png'
        }
      }

      post "/fictional_chars", params: fictional_char_params
      fictional_char = FictionalChar.first
      delete "/fictional_chars/#{fictional_char.id}"
      expect(response).to have_http_status(200)
      fictional_chars = FictionalChar.all 
      expect(fictional_chars).to be_empty
    end
  end
end
