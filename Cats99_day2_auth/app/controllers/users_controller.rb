class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save!
      login!(@user)
      redirect_to cats_url
    else
      flash[:errors] = @user.errors.full_messages
    end
  end
  
  # def show
  #   user = User.find(user_params[:user_name])
  #   render :show
  # end
  
  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
  
end
