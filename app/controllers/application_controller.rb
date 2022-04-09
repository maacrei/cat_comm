class ApplicationController < ActionController::Base
  devise_group :user_or_admin, contains: [:user, :admin]

  # devise利用の機能が使われる前にconfizuere_permitted_parametersを実行する
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_users_path
    else
      post_images_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
  		root_path
    end
  end

  protected
  # サインアップ時に名前を保存するため
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
