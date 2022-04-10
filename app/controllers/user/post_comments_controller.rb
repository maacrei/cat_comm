class User::PostCommentsController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    # comment = current_user.post_comments.new(post_comment_params) 下の２行を略した記述方法
    comment = PostComment.new(post_comment_params)
    comment.user_id = current_user.id
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    # redirect_to post_image_path(post_image)だと失敗する
    # 直前のページにリダイレクト
    redirect_back fallback_location: root_path
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
