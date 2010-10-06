class ApplicationController < ActionController::Base
  include Authentication

  protect_from_forgery

  # Require authentication for everything
  before_filter :login_required
end
