class UsersController < ApplicationController
  def index
    @user = current_user
    @post_users = User.all
    @new = Book.new
    # binding.pry
  end
  
  def show
    @user = User.find(params[:id])
    @new = Book.new
    @books = Book.where(user_id: @user.id)
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:update] = "You have updated user successfully."
      redirect_to user_path
    else
      render "edit"
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
