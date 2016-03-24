class SessionsController < ApplicationController

  def create
    return self.invalid_login if self.session_authenticator.invalid?

    sign_in self.session_authenticator.user, :store => false

    render :json => {
        :id => self.session_authenticator.user.id,
        :email => self.session_authenticator.user.email,
        :name => self.session_authenticator.user.name,
        :auth_token => self.session_authenticator.user.auth_token
      }
  end





  protected

  def session_authenticator
    @session_authenticator ||= SessionAuthenticator.new params[:user]
  end

  def invalid_login
    warden.custom_failure!

    render :json => {:message => 'Invalid email or password'},
      :status => :unauthorized
  end

end
