class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to '/users'
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :plofile_image)
  end

end
