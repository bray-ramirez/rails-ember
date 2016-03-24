class CreatePostForm < PostForm

  def save
    super

    ActivityLogger.new(self.model, Activity::ACTION::CREATE).log if self.model.visible?
  end

end