class UpdatePostForm < PostForm

  def save
    super

    ActivityLogger.new(self.model, Activity::ACTION::UPDATE).log
  end

end