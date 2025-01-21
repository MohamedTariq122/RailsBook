class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  def editable_by?(user)
    user.present? && user == self.user
  end

  def comments_count
    self[:comments_count] || 0
  end

  def reload_comments_count
    comments.reload.count
  end
end
