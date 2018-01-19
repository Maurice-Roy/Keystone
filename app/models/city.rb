class City < ApplicationRecord
  has_many :architectures
  has_many :reviews, through: :architectures
  has_many :artists, through: :architectures
end
