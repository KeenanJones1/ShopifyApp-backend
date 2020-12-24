require "json_web_token.rb"

class UsersController < ApplicationController
 def show
  user = User.find(params["id"])
  if user
    render json: user.as_json(
     only: [:username],
     include: {images: {only: [:id, :name, :imgUrl]}}
    )
  end
end


def create
  user = User.new(user_params)
  if user.save
      payload = { user_id: user.id }
      token = JsonWebToken.encode(payload)
      render json: token.to_json
    else
      render json: {errors: user.errors.full_messages}
    end
end


private 
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
