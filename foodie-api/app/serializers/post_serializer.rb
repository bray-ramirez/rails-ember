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

class PostSerializer < ActiveModel::Serializer

  attributes :id, :title, :content, :user_id, :author, :type, :visible,
    :created_at


  def author
    self.object.user.name
  end

  def type
    self.object.type.underscore
  end

end
