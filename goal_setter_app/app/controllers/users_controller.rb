class UsersController < ApplicationController
  
  def new
    @user = User.new #creates new user, renders :new
  end
  
  def create #creates new user, checks 
    @user = User.new(user_params)
    
    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end
  
  def show 
    @user = current_user
    render :show
  end 
  
  private 
  
  def user_params 
    params.require(:user).permit(:username, :password)
  end 
end
