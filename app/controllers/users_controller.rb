class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @users = User.all
    @book = Book.new
    @books = @user.books
  end


  def edit
    @user = User.find(params[:id])
    if @user ==current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end


  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @books = Book.all
  end




  def update
    @user = User.find(params[:id])
    @user.id = current_user.id
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end


  private

   def user_params
     params.required(:user).permit(:name, :introduction, :profile_image)
   end


end
