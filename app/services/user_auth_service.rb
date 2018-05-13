class UserAuthService
   def initialize(email, password)
      @email = email
      @password = password
   end

   def authenticate!
      user
   end

   def authenticate_admin!
      user.admin?
   end

   def generate_token!
      JsonWebTokenService.encode(user_id: user.id) if user
   end

   private
   attr_accessor :user, :password
   def user
      user = User.find_by(email: @email)
      if user && user.authenticate(password)
         user
      else
         raise "invalid credentials"
      end
   end
end
