module ErrorsSupport

  extend ActiveSupport::Concern





  protected

  def not_found_error
    render :json => {:message => 'Record not found'}, :status => :not_found
  end

end
