class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found_message
    def index
      spice=Spice.all 
      render json: spice
    end

    def show
     spice=spice_find_by
     render json: spice
    end

    def create
      spice=Spice.create(new_param)
      render json: spice, status: 201
     end

     def update
      spice=spice_find_by
      spice.update(new_param)
      render json: spice
     end

     def destroy
      spice=spice_find_by
      spice.destroy
      render json: {}
     end

private
    def new_param
      params.permit(:title, :image, :description, :notes, :rating)
    end
    def not_found_message
      render json: {message: "not found"}
    end

    def spice_find_by
      spice=Spice.find(params[:id])
    end
end