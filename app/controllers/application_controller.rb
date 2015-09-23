class ApplicationController < ActionController::Base
  include SecureHeaders
  protect_from_forgery
  ensure_security_headers
  before_filter :set_as_private

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  def set_as_private
    expires_now
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def sign_out(*args)
    #to invalidate session on sign out
    current_user.update_attribute(:unique_session_id, "") unless current_user.nil?
    current_admin_user.update_attribute(:unique_session_id, "") unless current_admin_user.nil?   
    super
  end

  def block_inactive_user!
    if current_user.unregistered?
      redirect_to "/inactive.html"
    end
  end

  def authenticate_inactive_active_admin_user!
    unless current_admin_user.nil?
      if current_admin_user.inactive
        redirect_to "/inactive.html"
      end
    end
  end
end
