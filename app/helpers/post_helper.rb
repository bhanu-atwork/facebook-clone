module PostHelper

  def count_post_likes(id)
    Post.find(id).likes.count
  end

  def count_post_comments(id)
    Post.find(id).comments.count
  end

  def get_post_comments(id)
    Post.find(id).comments
  end

end