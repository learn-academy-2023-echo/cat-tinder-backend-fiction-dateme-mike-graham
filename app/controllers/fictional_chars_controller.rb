class FictionalCharsController < ApplicationController

    def index
     fictional_chars = FictionalChar.all
     render json: fictional_chars   
    end

    def create
        fictional_char = FictionalChar.create(fictional_char_params)
        render json: fictional_char
    end

    def update
    end

    def destroy
    end

end

private
    def fictional_char_params 
    params.require(:fictional_char).permit(:name, :age, :enjoys, :image)
    end
end