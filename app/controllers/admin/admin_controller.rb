class Admin::AdminController < ActionController::Base
  helper :all
  protect_from_forgery

  layout "admin"
  before_filter :authenticate

  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['ADMIN_USER'] && password == ENV['ADMIN_PASS']
      end
    end
end

