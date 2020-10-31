class RacesController < ApplicationController
    def race_params
        params_require(:race).permit(:id)
    end
    
    def show
        @race = Race.find(params[:id])
        i = 0
        if @race.hassubrace
            @subrace = SubRace.where(race: @race.name)
                              .order(Arel.sql('RANDOM()'))
                              .first
            puts @subrace
            @race.features.push + @subrace.features
            @subrace.abilitymodifiers do |abilitymod|
                @race.abilitymodifiers[i] += abilitymod
                i += 1
            @race.size = @subrace.size
            @race.skillproficiencies + @subrace.skillproficiencies
            @race.toolsandlanguages + @subrace.toolsandlanguages
            @race.name = @subrace.name + @race.name
        end
        puts @race.to_json
        render json: @race.to_json
    end
end
