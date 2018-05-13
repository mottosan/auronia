module HttpAuthConcern
  extend ActiveSupport::Concern
  def http_authenticate
      authenticate_or_request_with_http_basic do |email, password|
          UserAuthService.new(email, password).authenticate!
      end
  end

  def http_authenticate_admin
      authenticate_or_request_with_http_basic do |email, password|
          UserAuthService.new(email, password).authenticate_admin!
      end
  end
end
