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
  authorization_object = Authorization.new(request)
  current_user = authorization_object.current_user
  user = User.find(current_user)

  byebug

  img = Image.new(name: 'anasi', user: user)
  img.update(img: params[:image])
  
  # img.img.attach(params['image'])

  imgUrl = rails_blob_path(img.img)
  img.update(imgUrl: imgUrl)
  
  # user.image.attach(params['image'])
  # imgUrl = url_for(user.image)
  # user.update(imgUrl: imgUrl)
  
  if img.save
   render json: {user: user}
  else
   render json: {error: 'Invalid Image'}, status: 401
  end
 end 

 def update
  byebug
 end 

 def delete
  byebug
 end

end
