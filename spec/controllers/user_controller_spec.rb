require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController do

  before(:each) {
    @person = User.create(username: 'Dingus',
            password: 'dinguspass',
            password_confirmation: 'dinguspass')
  }

  describe 'create' do
    it "creates a new user" do
      expect(User.last.username).to eq('Dingus')
    end

  end
end
