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

class RecipesController < BaseController

  include PostSupport





  protected

  def records
    @records ||= current_user.recipes.latest
  end

  def viewable_record
    @viewable_record ||= self.recipe
  end

  def record
    @record ||= current_user.recipes.find_by_id params[:id]
  end

  def new_record
    current_user.recipes.new
  end

  def record_params
    params[:recipe]
  end

  def recipe
    self.owned_recipe || Recipe.published.find_by_id(params[:id])
  end

  def owned_recipe
    current_user.recipes.find_by_id(params[:id]) if current_user
  end

  def root
    :recipe
  end

end
