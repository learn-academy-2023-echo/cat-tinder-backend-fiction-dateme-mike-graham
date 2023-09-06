class FictionalCharsController < ApplicationController
  def index
    fictional_chars = FictionalChar.all
    render json: fictional_chars   
  end

  def create
    fictional_char = FictionalChar.create(fictional_char_params)
    if fictional_char.valid?
      render json: fictional_char
    else
      render json: fictional_char.errors, status: 422
    end 
  end

  def update
  end

  def destroy
  end

  private
  def fictional_char_params 
    params.require(:fictional_char).permit(:name, :age, :enjoys, :image)
  end
end