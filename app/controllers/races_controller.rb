class RacesController < ApplicationController
    def race_params
        params_require(:race).permit(:id)
    end
    
    def show
        @race = Race.find(params[:id])
        puts @race.to_json
        render json: @race.to_json
    end
end
