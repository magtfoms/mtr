class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #def after_sign_in_path_for(resource)
  #  current_user_path
  #end

  def authenticate_admin!
    redirect_to new_user_session_path unless user_signed_in? && current_user.admin
  end
  
  #def after_sign_in_path_for(resource)
  #  stored_location_for(resource) ||
  #      if resource.is_a?(User) && resource.can_publish?
  #        publisher_url
  #      else
  #        super
  #      end
  #end

  #def after_sign_out_path_for(resource_or_scope)
  #  request.referrer
  #end

end
