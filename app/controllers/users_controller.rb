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

    respond_to do |format|
      if @user.save
        session[:user_id]= @user.id
        redirect_to @user, notice: 'User was complteted created.'
         render :index, status: :created, location: @user
      else
      render :new 
      end
    end
  end
  def update
    respond_to do |format|
      if @user.update(user_params)
         redirect_to @user, notice: 'User was complteted updated.' 
        render :show, status: :ok, location: @user 
      else
      render :edit 
      end
    end
  end
  def destroy
    @user.destroy
    respond_to do |format|
     redirect_to users_url, notice: 'User was complteted destroyed.' 
    end
  end
  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:firstName, :lastName, :email, :address, :bio, :occupation, :expertise, :admin, :mentor, :password, :password_confirmation)
    end
end
