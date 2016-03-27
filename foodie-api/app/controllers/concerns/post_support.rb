module PostSupport

  extend ActiveSupport::Concern

  include ErrorsSupport

  included do
    before_action :authenticate_access!,
      :only => [:index, :create, :update, :destroy]
  end


  def index
    render :json => self.records,
      :each_serializer => PostSerializer
  end

  def show
    return self.not_found_error if self.viewable_record.nil?

    render :json => self.viewable_record,
      :serializer => PostSerializer,
      :root => self.root
  end

  def create
    form = PostForm.new self.new_record

    if form.validate self.record_params
      form.save

      render :json => form.model,
        :serializer => PostSerializer,
        :root => self.root
    else
      render :json => {
        :errors => form.errors
      }, :status => :unprocessable_entity
    end
  end

  def update
    return self.not_found_error if self.record.nil?

    form = PostForm.new self.record

    if form.validate self.record_params
      form.save

      render :json => form.model,
        :serializer => PostSerializer,
        :root => self.root
    else
      render :json => {
        :errors => form.errors
      }, :status => :unprocessable_entity
    end
  end

  def destroy
    return self.not_found_error if self.record.nil?

    PostDestroyer.new(self.record).destroy

    render :json => {}, :status => :ok
  end

end
