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

class BlogsController < BaseController

  include PostSupport





  protected

  def records
    @records ||= current_user.blogs.latest
  end

  def viewable_record
    @viewable_record ||= self.blog
  end

  def record
    @record ||= current_user.blogs.find_by_id params[:id]
  end

  def new_record
    current_user.blogs.new
  end

  def record_params
    params[:blog]
  end

  def blog
    self.owned_blog || Blog.published.find_by_id(params[:id])
  end

  def owned_blog
    current_user.blogs.find_by_id(params[:id]) if current_user
  end

  def root
    :blog
  end

end
