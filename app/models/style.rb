class Style < ApplicationRecord
  has_many :architectures
  has_many :artists, through: :architectures
  has_many :cities, through: :architectures

  validates :name, uniqueness: true, presence: true
end
