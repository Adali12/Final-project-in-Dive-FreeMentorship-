class CommentsController < ApplicationController
#   def create
#     @profile = Profile.find(params[:profile_id])
#     @comment = @profile.comments.build(comment_params)
#       if @comment.save
#          render :index
#       else
#       redirect_to profile_path(@profile), notice: 'Post failed...' 
#       end
#   end
#   def destroy
#     @profile = Profile.find(params[:profile_id])
#     @comment = Comment.find(params[:id])
#     @comment.destroy
#       redirect_to @profile 
#   end

# def update
#     if @comment.update(params[:profile_id])
#     redirect_to @profile, notice: 'Profile was  updated.' 
#     else
#       render :edit 
#     end
# end
#   private
#   def comment_params
#     params.require(:comment).permit(:profile_id, :content)
#   end


before_action :find_post
 before_action :find_comment, only: [:destroy, :edit , :update]
def create
@comment = @profile.comments.create(params[:comment].permit(:content))
@comment.save
if @comment.save
  redirect_to profile_path(@profile)
else
  render 'new'
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