class Review < ApplicationRecord
  belongs_to :user
  belongs_to :architecture

  validates :content, presence: true
end
