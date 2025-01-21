class GuestUser < ApplicationRecord
  has_many :posts, as: :author, dependent: :destroy

  validates :session_token, presence: true, uniqueness: true

  def display_name
    "Guest-#{session_token[0..5]}"
  end

  def self.cleanup_old_records
    where("updated_at < ?", 30.days.ago).destroy_all
  end
end
