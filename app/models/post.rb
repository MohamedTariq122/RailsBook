class Post < ApplicationRecord
belongs_to :user
alias_method :author, :user

validates :title, presence: true
validates :content, presence: true

def editable_by?(user)
    user.present? && user == self.user
end
end
