class ApplicationController < ActionController::Base
  force_ssl

  protect_from_forgery with: :exception
end
