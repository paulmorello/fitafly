class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  add_flash_types :success, :warning, :danger, :info
  include SessionHelper
  include EventHelper

end
