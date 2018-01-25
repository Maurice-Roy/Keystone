class Review < ApplicationRecord
  belongs_to :user
  belongs_to :architecture

  validates :content, presence: true
  validates :architecture_id, uniqueness: {scope: :user_id, message: " has already been reviewed!"}

  def user_name
    self.user.username
  end
end
