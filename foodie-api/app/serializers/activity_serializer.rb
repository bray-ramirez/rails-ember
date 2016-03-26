# == Schema Information
#
# Table name: activities
#
#  id             :integer          not null, primary key
#  action         :integer          not null
#  trackable_id   :integer          not null
#  trackable_type :string           not null
#  user_id        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_activities_on_action_and_trackable_id_and_trackable_type  (action,trackable_id,trackable_type)
#  index_activities_on_user_id                                     (user_id)
#

class ActivitySerializer < ActiveModel::Serializer

  ACTION_DESCRIPTION = ['created', 'updated', 'deleted']


  attributes :id, :action, :trackable_id, :trackable_type,
    :is_active, :is_visible, :created_at, :user_id


  def action
    "#{self.actor} #{ACTION_DESCRIPTION[self.object.action]} a " \
    "#{self.object.trackable_type} on #{self.date}"
  end

  def trackable_type
    self.object.trackable_type.underscore
  end

  def is_active
    self.object.trackable.present?
  end

  def is_visible
    return false if self.object.trackable.nil?

    self.object.trackable.visible?
  end

  def user_id
    return nil if self.object.trackable.nil?

    self.object.trackable.user_id
  end





  protected

  def actor
    self.object.user.name
  end

  def date
    self.object.created_at.strftime '%d %B %Y'
  end

end
