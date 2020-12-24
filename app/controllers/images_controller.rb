class ImagesController < ApplicationController
 wrap_parameters :image, include: [:name, :imgUrl]

 def index
  @images = Image.all
  # byebug
  render json: @images
 end

 def show
  byebug
 end 

 def create 
  byebug
 end 

 def update
  byebug
 end 

 def delete
  byebug
 end

end
