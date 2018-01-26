class Review < ApplicationRecord
  belongs_to :user
  belongs_to :architecture

  validates :content, presence: true
  validates :content, length: { maximum: 250}
  validates :architecture_id, uniqueness: {scope: :user_id, message: " has already been reviewed!"}

  def user_name
    self.user.username
  end

  def self.avg_rating
    @relevant_architectures = Review.all.map do |review|
      review.architecture
    end.uniq

    @sorted_arcs = @relevant_architectures.sort_by do |arc|
      arc.average_rating
    end
  end

  def self.highest_rated
    "Highest: #{self.avg_rating.last.name}: #{self.avg_rating.last.average_rating}"
  end

  def self.lowest_rated
    "Lowest: #{self.avg_rating.first.name}: #{self.avg_rating.first.average_rating}"
  end

  def self.average_content_rating
    @content = self.all.map do |review|
      review.content.length
    end
    @content_avg = @content.reduce(:+) / @content.size.to_f
    "#{@content_avg} characters"
  end

  def self.average_rated
    @avg = self.all.map(&:rating).reduce(:+).to_f / self.all.size
    "Average: #{@avg}"
  end

end
