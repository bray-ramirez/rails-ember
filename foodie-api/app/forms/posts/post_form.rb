class PostForm < Reform::Form

  properties :title, :content, :visible


  validates :title, :presence => true

end