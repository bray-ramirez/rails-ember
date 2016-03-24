class BaseController < ApplicationController

  before_filter :authenticate_user_from_token!


  # def preflight
  #   render nothing: true
  # end





  protected

  def authenticate_user_from_token!
    return if request.headers['X-Authorization-Token'].blank? &&
      request.headers['X-Authorization-Email'].blank?

    user =
      User.where(
        :auth_token => request.headers['X-Authorization-Token'],
        :email => request.headers['X-Authorization-Email']
      ).first

    return self.authentication_error unless user

    sign_in user, :store => false
  end

  def authenticate_access!
    return self.authentication_error unless current_user
  end

  def authentication_error
    render :json => {:message => 'Unauthorized access.'},
      :status => :unauthorized
  end

end
