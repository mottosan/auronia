module TokenAuthConcern
  def authenticate_request
    @current_user = AuthenticationService.new(request.headers).authenticate!
      render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
