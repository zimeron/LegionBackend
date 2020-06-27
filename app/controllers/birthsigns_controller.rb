class BirthsignsController < ApplicationController
    def birthsign_params
        params_require(:birthsign).permit(:id)
    end
    
    def show
        @birthsign = Birthsign.find(params[:id])
        puts @birthsign.to_json
        render json: @birthsign.to_json
    end
end
