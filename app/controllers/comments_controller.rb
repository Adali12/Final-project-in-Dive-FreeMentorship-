class CommentsController < ApplicationController
  def create
    @profile = Profile.find(params[:profile_id])
    @comment = @profile.comments.build(comment_params)
      if @comment.save
         render :index
      else
      redirect_to profile_path(@profile), notice: 'Post failed...' 
      end
  end
  def destroy
    @profile = Profile.find(params[:profile_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
      redirect_to @profile 
  end

def update
    if @comment.update(params[:profile_id])
    redirect_to @profile, notice: 'Profile was  updated.' 
    else
      render :edit 
    end
end
  private
  def comment_params
    params.require(:comment).permit(:profile_id, :content)
  end
end
