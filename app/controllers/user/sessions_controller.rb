class User::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  # ゲストログイン機能
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to post_images_path
  end

  protected

  def user_state
    @user = User.find_by(email: params[:user][:email])
    return if !@user
    if @user.valid_password?(params[:user][:password]) && @user.is_deleted == true
      redirect_to new_user_registration_path, alert: "退会済みのユーザーです。"
    end
  end

end
