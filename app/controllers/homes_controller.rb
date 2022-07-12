class HomesController < ApplicationController
  #load_and_authorize_resource
  # "root_path" , home page for college and users
  def index
    #byebug
     if current_user.role? == "superadmin"  
      @college = College.all
      #byebug
       @user = current_user.users
    elsif current_user.has_role? :college
      @user = current_user.users
      @event = Event.new()
      @events = Event.all
    elsif current_user.has_role? :student
      @events = current_user.events
      
    end
  end
  # homes/show.html.erb in views
  def show 
    @users = User.find(params[:id])
  end

  #homes/edit.html.erb in views
  def edit
    @user = User.find(params[:id])
  end

  #Put method for updating existing class
  def update
   @user = User.find(params[:id])
   @user.update(find_params)
   redirect_to root_path
  end

  #Delete method for destroy user
  def destroy
     @user = User.find(params[:id])
     @user.destroy
    redirect_to root_path
  end

  private
   def find_params
      params.require(:user).permit(:username, :email, :enrollment, :course, :branch, :year, :collegename, :collegecode)

    end
  
end
