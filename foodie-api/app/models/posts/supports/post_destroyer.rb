class PostDestroyer

  def initialize object
    raise 'Invalid Object' unless object.is_a? Post

    @object = object
  end

  def destroy
    @object.destroy

    ActivityLogger.new(@object, Activity::ACTION::DESTROY).log
  end

end
