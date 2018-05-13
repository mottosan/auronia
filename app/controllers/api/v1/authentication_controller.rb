module Api::V1
  class AuthenticationController < ApiController
    skip_before_action :authenticate_request

    def create
      token = UserAuthService.new(params[:email], params[:password]).generate_token!
      if token
        render json: {
          token: token
        }
      end
    rescue => e
        render json: {
          error: e.message
        }, status: :unauthorized
    end
  end
end
