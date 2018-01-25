class Artist < ApplicationRecord
  has_many :architectures
  has_many :reviews, through: :architectures
  has_many :cities, through: :architectures
  has_many :styles, through: :architectures
  validates :name, uniqueness: true, presence: true

  def self.sorted
    Artist.all.sort_by {|artist| artist.name}
  end
end
