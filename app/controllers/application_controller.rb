class ApplicationController < ActionController::Base
  devise_group :customer_or_admin, contains: [:customer, :admin]
  
  private

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      about_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
      new_customer_session_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
  		root_path
    end
  end  
  
end
