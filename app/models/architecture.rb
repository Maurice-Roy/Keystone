class Architecture < ApplicationRecord
  belongs_to :city
  belongs_to :artist
  has_many :reviews

  validates :name, uniqueness: true, presence: true
  validates :year_created, presence: true
  #validate associations?

end
