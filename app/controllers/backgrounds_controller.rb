class BackgroundsController < ApplicationController
    def background_params
        params_require(:background).permit(:id)
    end
    
    def show
        @background = Background.find(params[:id])
        puts @background.to_json
        render json: @background.to_json
    end
end
