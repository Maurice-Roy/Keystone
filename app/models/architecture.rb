class Architecture < ApplicationRecord
  belongs_to :city
  belongs_to :artist

  validates :name, uniqueness: true, presence: true
  validates :year_created, presence: true
  #validate associations?

end
