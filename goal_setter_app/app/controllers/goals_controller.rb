class GoalsController < ApplicationController
  
  def new
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

  def edit
  end
  
  private 
  
  def goal_params 
    params.require(:goal).permit(:title, :private, :complete)
  end 
end
