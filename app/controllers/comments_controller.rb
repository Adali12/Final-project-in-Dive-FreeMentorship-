class CommentsController < ApplicationController
  def create
    @profile = Profile.find(params[:profile_id])
    @comment = @profile.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
         render :index
      else
      redirect_to profile_path(@profile), notice: 'Post failed...' 
      end
    end
  end
  def destroy
    @profile = Profile.find(params[:profile_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      redirect_to @profile 
    end
end
def update
  respond_to do |format|
    if @comment.update(params[:profile_id])
    redirect_to @profile, notice: 'Profile was  updated.' 
    render :show, status: :ok, location: @profile 
    else
      render :edit 
    end
  end
end
  private
  def comment_params
    params.require(:comment).permit(:profile_id, :content)
  end
end
