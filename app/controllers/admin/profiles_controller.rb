class Admin::ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  def index
    @profiles= Profile.all
  end
  def show
    @comments = Comment.where(profile_id: @profile)
    # @comments = @profile.comments
    # @comment = @profile.comments.build
  end
  def new
    @profile = Profile.new
  end
  def edit
  end
  def create
    @profile = Profile.new(profile_params)
      if @profile.save
       redirect_to @profile, notice: 'Profile was created.'
      else
       render :new
    end
  end
  def update
      if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was updated.'
      else
       render :edit
      end
  end
  def destroy
    @profile.destroy
     redirect_to profiles_url, notice: 'Profile was  destroyed.'
  end
  private
    def set_profile
      @profile = Profile.find(params[:id])
    end
    def profile_params
      params.require(:profile).permit(:pic, :cv, :user_id)
    end
end
