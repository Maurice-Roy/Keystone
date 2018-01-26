class Style < ApplicationRecord
  has_many :architectures
  has_many :artists, through: :architectures
  has_many :cities, through: :architectures

  validates :name, uniqueness: true, presence: true
  validates :name, length: { minimum: 3}
  validates :name, length: { maximum: 20}

  def self.sorted
    Style.all.sort_by {|style| style.name}
  end
end
