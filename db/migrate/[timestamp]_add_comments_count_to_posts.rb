class AddCommentsCountToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :comments_count, :integer, default: 0
    
    # Reset counter cache for existing posts
    Post.find_each { |post| Post.reset_counters(post.id, :comments) }
  end
end
