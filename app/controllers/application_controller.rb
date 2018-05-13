class ApplicationController < ActionController::API
  include TokenAuthConcern
  before_action :authenticate_request
  attr_reader :current_user
end
