require 'rails_helper'

describe 'users', type: 'feature' do

  before do
    @review = Review.create(rating: 5, content: "Whoa, architecture.", architecture_id: 1, user_id: 1 )
    @user = User.create(username: 'CoolGuy5')
    @artist = Artist.create(name: "Big Dingus")
  end

  # describe 'show page' do
  #
  #   it 'should link to all of the posts the user commented on' do
  #     visit user_path(@user)
  #     expect(page).to have_link(@post.title, href: post_path(@post))
  #   end
  #
  # end



end
