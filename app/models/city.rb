class City < ApplicationRecord
  has_many :architectures
  has_many :reviews, through: :architectures
  has_many :artists, through: :architectures
  has_many :styles, through: :architectures
  validates :name, uniqueness: true, presence: true

  def self.sorted
    City.all.sort_by {|city| city.name}
  end

  def self.most_architectures
    @most_arcs = City.all.max_by do |city|
      city.architectures.count
    end
    "#{@most_arcs.name} :   " + @most_arcs.last.architectures.count.to_s
  end

  # def self.most_reviews
  #   @most_arcs = City.all.sort_by do |city|
  #     city.architectures.count
  #   end
  # end


end
