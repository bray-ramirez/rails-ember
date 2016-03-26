# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  content    :string
#  visible    :boolean          default(FALSE)
#  user_id    :integer          not null
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

class ReviewsController < BaseController

  include PostSupport





  protected

  def records
    @records ||= current_user.reviews.latest
  end

  def viewable_record
    @viewable_record ||= self.review
  end

  def record
    @record ||= current_user.reviews.find_by_id params[:id]
  end

  def new_record
    current_user.reviews.new
  end

  def record_params
    params[:review]
  end

  def review
    self.owned_review || Review.published.find_by_id(params[:id])
  end

  def owned_review
    current_user.reviews.find_by_id(params[:id]) if current_user
  end

  def root
    :review
  end

end
