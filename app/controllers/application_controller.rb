class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  config.relative_url_root = ""
end