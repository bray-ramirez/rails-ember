class SessionAuthenticator

  def initialize params = {}
    @email = params[:email]
    @password = params[:password]
  end

  def user
    @user ||= User.find_for_database_authentication :email => @email
  end

  def valid?
    return false unless self.user

    self.user.valid_password? @password
  end

  def invalid?
    !self.valid?
  end

end
