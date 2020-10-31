class RacesController < ApplicationController
    def race_params
        params_require(:race).permit(:id)
    end
    
    # GET request handler for races.  Grabs the race specified by the id param from the database, along with a randomly selected subrace if applicable.
    # Splices together the data from Race and Subrace into Race and packages into JSON for the frontend.
    def show
        # Grab race by id
        @race = Race.find(params[:id])
        i = 0
        
        # If this race has subraces, select one at random
        if @race.hassubrace
            @subrace = SubRace.where(race: @race.name)
                              .order(Arel.sql('RANDOM()'))
                              .first
            # Add subrace features (might need some more logic here for Khajiit)
            @race.features.concat(@subrace.features)

            # Add subrace ability mods (might need a nilguard)
            while i < @race.abilitymodifiers.length()
                @race.abilitymodifiers[i] += @subrace.abilitymodifiers[i]
                i += 1
            end

            # Updates size if needed (Khajiit possibly)
            @race.size = @subrace.size

            # Checks for skill, tool proficiencies and updates them
            unless @subrace.skillproficiencies.nil?
                @race.skillproficiencies.concat(@subrace.skillproficiencies)
            end
            unless @subrace.toolsandlanguages.nil?
                @race.toolsandlanguages.concat(@subrace.toolsandlanguages)
            end

            # Specifies subrace in the overall race name
            @race.name = @subrace.name + " " + @race.name
        end

        # Debug and packaging for frontend
        puts @race.to_json
        render json: @race.to_json
    end
end
