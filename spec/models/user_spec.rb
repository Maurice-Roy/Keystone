require 'rails_helper'
require 'spec_helper'

describe 'user' do
  it 'has a username field' do
    expect(User.new).to respond_to(:username)
  end

  it 'has a password field' do
    expect(User.new).to respond_to(:password)
  end

  it 'has a password confirmation field' do
   expect(User.new).to respond_to(:password_confirmation)
 end

  it "is invalid if password and password_confirmation are both non-nil and don't match" do
   user = User.new
   user.password = 'leet'
   user.password_confirmation = 'l33t'
   expect(user.valid?).to be false
  end

  it 'returns the user if credentials match' do
    user = User.new
    user.password = 'leet'
    expect(user.authenticate('leet')).to eq(user)
  end

  it "returns falsey if credentials don't match" do
    user = User.new
    user.password = 'leet'
    expect(user.authenticate('l33t')).to be_falsey
  end

end
