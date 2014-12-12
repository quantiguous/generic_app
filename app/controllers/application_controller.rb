class ApplicationController < ActionController::Base
  protect_from_forgery
  ensure_security_headers
  before_filter :set_as_private

  def set_as_private
    expires_now
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def block_inactive_user!
    if current_user.unregistered?
      redirect_to "/inactive.html"
    end
  end

  def authenticate_inactive_active_admin_user!
    if current_admin_user.inactive
      redirect_to "/inactive.html"
    end
  end
end
