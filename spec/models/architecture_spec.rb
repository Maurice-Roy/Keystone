require 'rails_helper'
require 'spec_helper'

describe 'architecture' do
  it 'has a name field' do
    expect(Architecture.new).to respond_to(:name)
  end

  it 'belongs to city' do
    expect(Architecture.new).to respond_to(:city_id)
  end

  it 'belongs to artist' do
    expect(Architecture.new).to respond_to(:artist_id)
  end

  it 'belongs to style' do
    expect(Architecture.new).to respond_to(:style_id)
  end

end
