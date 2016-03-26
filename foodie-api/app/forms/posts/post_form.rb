class PostForm < Reform::Form

  properties :title, :content, :visible


  validates :title, :presence => true


  def save
    action = self.log_action

    super

    ActivityLogger.new(self.model, action).log
  end





  protected

  def log_action
    self.model.persisted? ? Activity::ACTION::UPDATE : Activity::ACTION::CREATE
  end

end
