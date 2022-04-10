class User::UsersController < ApplicationController
  def show
    @user = current_user
    @post_images = @user.post_images
    # お気に入りリストの表示
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_image_id)
    @favorite_list = PostImage.find(favorites)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  # 退会確認画面
  def unsubscribe
  end

  # 退会処理
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end