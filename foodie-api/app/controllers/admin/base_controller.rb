class Admin::BaseController < BaseController

  before_action :authenticate_admin





  protected

  def authenticate_admin
    return self.admin_error unless current_user.admin?
  end

  def admin_error
    render :json => {:message => 'Unauthorized access.'},
      :status => :unauthorized
  end

end
