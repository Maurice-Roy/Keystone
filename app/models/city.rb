class City < ApplicationRecord
  has_many :architectures
  has_many :reviews, through: :architectures
  has_many :artists, through: :architectures

  validates :name, uniqueness: true, presence: true
end
