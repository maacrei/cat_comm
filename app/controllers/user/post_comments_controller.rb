class User::PostCommentsController < ApplicationController

  def create
    @post_image = PostImage.find(params[:post_image_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user_id = current_user.id
    @post_comment.post_image_id = @post_image.id
    # 下記はエラーメッセージを非同期で表示させるための記述
    # 表示はできたがメッセージがリダイレクトをしないと消えないので実装保留中
    unless @post_comment.save
      render 'error_messages'
    end
    # if @post_comment.save
    #   render :create
    # else
    #   render 'error_messages'
    # end
  end

  def destroy
    PostComment.find(params[:id]).destroy
    @post_image = PostImage.find(params[:post_image_id])
    # render :index
    # redirect_to post_image_path(post_image)だと失敗する
    # 直前のページにリダイレクト
    # redirect_back fallback_location: root_path
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
