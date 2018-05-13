module Admin
  class ApplicationController < Administrate::ApplicationController
    include HttpAuthConcern

    before_action :http_authenticate_admin
  end
end
