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

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
