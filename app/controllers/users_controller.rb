class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @profiles= Profile.all
    @users = User.all
    User.find_each do |user|
      @users = User.all.where("mentor", "%#{params[:users]} %",true)
  end
  @search=User.search(params[:q])
  if params[:q]
  @users=@search.result
  end
end
  def show
    @profiles= Profile.all
  end
  def new
    @user = User.new
  end
  def edit
  end
  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id]= @user.id
        redirect_to @user, notice: 'User was complteted created.'
      else
      render :new 
    end
  end
  def update
      if @user.update(user_params)
         redirect_to @user, notice: 'User was complteted updated.'  
      else
      render :edit 
    end
  end
  def destroy
    @user.destroy
     redirect_to users_url, notice: 'User was complteted destroyed.' 
  end
  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:firstName, :lastName, :email, :address, :bio, :occupation, :expertise, :admin, :mentor, :password, :password_confirmation)
    end
end
