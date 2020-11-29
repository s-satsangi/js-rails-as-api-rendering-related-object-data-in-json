class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: sightings.to_json( :include =>{ 
            :bird =>{:only => [:name]}, 
            :location => {:only => [:latitude]}, },
            except: [:updated_at, :created_at])
    end
    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
        render json: sighting.to_json( include: [:bird, :location])
        else
            render json: "Yeah, I can't find a sighting with that :id, buddy."
        end
    end
end