class CharacterclassesController < ApplicationController
    def characterclass_params
        params_require(:characterclass).permit(:id)
    end
    
    def show
        @characterclass = Characterclass.find(params[:id])
        puts @characterclass.to_json
        render json: @characterclass.to_json
    end
end
