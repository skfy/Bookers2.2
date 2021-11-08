class UsersController < ApplicationController
 before_action :correct_user,only: [:edit]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
     flash[:notice] = "Welcome! You have signed up successfuly."
     redirect_to users_path
    else
     render action: :new
    end
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user.id
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user.id)
    else
     render action: :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :plofile_image)
  end

  def correct_user
     @user = User.find(params[:id])
     if @user != current_user
      redirect_to user_path(current_user)
     end
  end

end
