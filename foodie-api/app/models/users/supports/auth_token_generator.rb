class AuthTokenGenerator

  def generate
    @token = Devise.friendly_token

    while self.token_exists? do
      @token = Devise.friendly_token
    end
    
    @token
  end





  protected

  def token_exists?
    User.where(:auth_token => @token).present?
  end

end