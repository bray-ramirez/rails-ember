class Admin::UsersController < Admin::BaseController

  include ErrorsSupport


  def index
    render :json => User.non_admin.alphabetical,
      :each_serializer => UserSerializer
  end

  def create
    form = UserForm.new User.new

    if form.validate params[:user]
      form.save

      render :json => form.model, :serializer => UserSerializer
    else
      # Do something
    end
  end

  def destroy
    user = User.find_by_id params[:id]
    return self.not_found_error if user.nil?

    user.destroy

    render :json => {:success => true}
  end

end
