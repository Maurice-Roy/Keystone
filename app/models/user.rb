class User < ApplicationRecord
  has_many :reviews
  has_secure_password

  validates :username, presence: true
  validates :username, length: { maximum: 20}
  validates :username, length: { minimum: 3}

  def self.highest_number_of_reviews
    @user = User.all.max_by{|user| user.reviews.size}
    "#{@user.username}: #{@user.reviews.size} Reviews"
  end

  def self.average_number_of_reviews
    @num_reviews = User.all.map{|user| user.reviews.size}
    @avg = @num_reviews.reduce(:+).to_f / @num_reviews.size
    "Reviews: #{@avg}"
  end


end
