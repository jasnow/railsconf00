class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        if Rails.env.production?
          username == ENV['HTTP_USER'] && password == ENV['HTTP_PASSWORD']
        else
          secure_compare(username, "foo") && secure_compare(password, "bar")
        end
      end
    end
end
