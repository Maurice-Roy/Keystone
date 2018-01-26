class City < ApplicationRecord
  has_many :architectures
  has_many :reviews, through: :architectures
  has_many :artists, through: :architectures
  has_many :styles, through: :architectures

  validates :name, uniqueness: true, presence: true
  validates :name, length: { minimum: 3}
  validates :name, length: { maximum: 20}

  def self.sorted
    City.all.sort_by {|city| city.name}
  end

  def self.most_architectures
    @most_arcs = City.all.max_by do |city|
      city.architectures.count
    end
    "#{@most_arcs.name} :   " + @most_arcs.architectures.count.to_s
  end

  # def self.highest_reviewed_architecture
  #   @new_hash = Hash.new(0)
  #   @second_new_hash = Hash.new(0)
  #   @city_names = Review.avg_rating.each do |architecture|
  #     @new_hash[architecture.city.name] += 1
  #     @second_new_hash[architecture.city.name] += architecture.average_rating
  #     @sorted = @second_new_hash.map do |city, avg_arch_rating|
  #       avg_arch_rating / @new_hash[city]
  #     end.sort_by {|k,v| v}.reverse
  #     byebug
  #     # "#{@sorted.first.key} - #{@sorted.first.value}"
  #   end

# add to analytics erb
  # <h4>City With Highest Average Reviews</h4>
  # <li><%= @city_with_highest_avg_reviews %></li>


  # end

  # def self.most_reviews
  #   @most_arcs = City.all.sort_by do |city|
  #     city.architectures.count
  #   end
  # end


end
