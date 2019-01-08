class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_logged
    authenticate_or_request_with_http_basic("index") do |username,password|
      username=="admin" and password=="senha"
    end
  end

end
