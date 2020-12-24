class UserSerializer 
 def initialize(user_object)
  @user = user_object
 end

 def to_serialized_json
  @user.to_json(:only => [:username], :include => {:images => {:only => [:id, :name, :imgUrl]}})
 end

end
