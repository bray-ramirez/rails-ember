module PostSupport

  extend ActiveSupport::Concern

  include ErrorsSupport

  included do
    before_action :authenticate_access!,
      :only => [:create, :update, :destroy]
  end


  def show
    return self.not_found_error if self.viewable_record.nil?

    render :json => self.viewable_record,
      :serializer => PostSerializer,
      :root => self.root
  end

  def create
    form = CreatePostForm.new self.new_record

    if form.validate self.record_params
      form.save

      render :json => form.model,
        :serializer => PostSerializer,
        :root => self.root
    else
      # Do Something
      puts 'Create Error'
    end
  end

  def update
    return self.not_found_error if self.record.nil?

    form = UpdatePostForm.new self.record

    if form.validate self.record_params
      form.save

      render :json => form.model,
        :serializer => PostSerializer,
        :root => self.root
    else
      # Do Something
      puts 'Update Error'
    end
  end

  def destroy
    return self.not_found_error if self.record.nil?

    PostDestroyer.new(self.record).destroy

    render :json => {:success => true}
  end

end
