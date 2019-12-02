class CommentsController < ApplicationController
before_action :find_post
 before_action :find_comment, only: [:destroy, :edit , :update]
def create
@comment = @profile.comments.create(params[:comment].permit(:content))
@comment.save
if @comment.save
  redirect_to profile_path(@profile)
else
  redirect_to profile_path(@profile)
end
end
def destroy
@comment.destroy
redirect_to profile_path(@profile)
end
def edit
end
def update
if @comment.update(params[:comment].permit(:content))
  redirect_to profile_path(@profile)
  else
    render 'edit'
  end
end
private
def find_post
  @profile = Profile.find(params[:profile_id])
end
def find_comment
  @comment = @profile.comments.find(params[:id])
end
end