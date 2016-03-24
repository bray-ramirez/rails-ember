class ActivityLogger

  VALID_OBJECTS = [Blog, Recipe, Review]


  def initialize object, action
    raise 'Invalid object' if VALID_OBJECTS.exclude? object.class
    raise 'Invalid Action' if Activity::VALID_ACTIONS.exclude? action

    @object = object
    @action = action
  end

  def log
    Activity.create :action => @action,
      :trackable_id => @object.id,
      :trackable_type => @object.type,
      :user_id => @object.user_id
  end

end