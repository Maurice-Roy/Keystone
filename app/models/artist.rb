class Artist < ApplicationRecord
  has_many :architectures
  has_many :reviews, through: :architectures
  has_many :cities, through: :architectures

  validates_presence_of :name
  validates_uniqueness_of :name


end
