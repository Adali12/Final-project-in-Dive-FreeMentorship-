class Admin::ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  def index
    @profiles= Profile.all
  end
  def show
    @comments = @profile.comments
    @comment = @profile.comments.build
  end
  def new
    @profile = Profile.new
  end
  def edit
  end
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
       redirect_to @profile, notice: 'Profile was created.'
       render :show, status: :created, location: @profile 
      else
       render :new
      end
    end
  end
  def update
    respond_to do |format|
      if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was updated.'
      render :show, status: :ok, location: @profile 
      else
     render :edit
   
      end
    end
  end
  def destroy
    @profile.destroy
    respond_to do |format|
     redirect_to profiles_url, notice: 'Profile was  destroyed.'
    end
  end
  private
    def set_profile
      @profile = Profile.find(params[:id])
    end
    def profile_params
      params.require(:profile).permit(:pic, :cv, :user_id)
    end
end
