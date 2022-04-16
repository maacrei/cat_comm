class User::UsersController < ApplicationController
  # ユーザーがログインしているかどうか
  before_action :authenticate_user!
  # ゲストユーザーはユーザー編集、退会機能はなし
  before_action :ensure_guest_user, only: [:edit, :unsubscribe]

  def show
    @user = current_user
    # .order(created_at: :desc)で投稿を新着順に
    @post_images = @user.post_images.order(created_at: :desc).page(params[:page]).per(10)
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

  # ログインしているのがゲストユーザーだったら
  def ensure_guest_user
    @user = current_user
    if @user.name == "guestuser"
      redirect_to post_images_path
    end
  end

end