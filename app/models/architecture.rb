class Architecture < ApplicationRecord
  belongs_to :city
  belongs_to :artist
  belongs_to :style
  has_many :reviews

  validates :name, uniqueness: true, presence: true

end
