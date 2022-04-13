class ApplicationController < ActionController::Base
  # deviseの複数権限
  devise_group :user_or_admin, contains: [:user, :admin]
  # ログインしているかどうか（topページ・aboutページ・sign_inは除く）
  before_action :authenticate_user_or_admin!, except: [:top, :about, :create]
  # devise利用の機能が使われる前にconfizuere_permitted_parametersを実行する
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope == :admin
      admin_users_path
    else
      post_images_path
    end
  end

  # ログアウト後の遷移先はadminもuserもトップページ
  def after_sign_out_path
    root_path
  end

  protected
  # サインアップ時に名前を保存するため
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
