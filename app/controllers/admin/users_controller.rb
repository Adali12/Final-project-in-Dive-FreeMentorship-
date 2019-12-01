class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin_user!
  def ensure_admin_user!
  unless current_user and current_user.admin?
    redirect_to root_path, notice:"you are not admin, ask for help?"
  end
  end
def index  
  @profiles= Profile.all
User.find_each do |user|
    @users = User.all 
    @profiles= Profile.all 
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
        redirect_to admin_users_path(@user), notice: 'User was created.'
      else
     render :new 
    end
  end
  def update
  if params[:mentor]
    @user.update(mentor: params[:mentor])
      redirect_to admin_user_path(@user), notice: 'user changed'
  elsif @user.update(user_params)
    redirect_to admin_user_path(@user), notice: 'User was  updated.'
     render :index, status: :ok, location: admin_user_path(@user) 
      else
        render :edit
    end
  end
  def destroy
    @user.destroy
     redirect_to admin_users_path, notice: 'User was  destroyed.'  
  end
  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:firstName, :lastName, :email, :address, :bio, :occupation, :expertise, :admin, :mentor, :password, :password_confirmation)
    end
end
