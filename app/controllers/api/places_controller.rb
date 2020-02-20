class Api::PlacesController < ApplicationController

  def index
    @places = Place.all
    render "index.json.jb"
  end

  def create
    @place = Place.new(
      name: params[:name],
      address: params[:address]
      ) 
    render "show.json.jb"
  end

  def show
    @place = Place.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @place = Place.find_by(id: params[:id])
    @place.name = params[:name] || @place.name
    @place.address = params[:address] || @place.address

    render "show.json.jb"    
  end

  def destroy
    @place = Place.find_by(id: params[:id])
    @place.destroy
    render json: {message: "record deleted"}
    
  end


end
