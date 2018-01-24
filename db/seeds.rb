require 'nokogiri'
require 'open-uri'
require 'uri'
require 'json'
require 'byebug'


url = "https://en.wikipedia.org/wiki/America%27s_Favorite_Architecture"
@page = Nokogiri::HTML(open(url))
@info = @page.css("table.wikitable tr")

@information = @page.css('table.wikitable tr').map { |tr|
  rank, structure, city, state, architect, style, picture = tr.css('td,th')
  structure, city, architect, style = [structure, city, architect, style].map{ |n| n && n.text ? n.text : nil }
  picture = picture.at('img')['src'] rescue nil

  {
    structure: structure,
    city: city,
    architect: architect,
    style: style,
    picture: picture

  }
}
@information.shift
@information.each do |entry|
  @city = City.find_or_create_by(name: entry[:city])
  @artist = Artist.find_or_create_by(name: entry[:architect])
  Architecture.create(name: entry[:structure], style: entry[:style], picture_url: entry[:picture], city_id: @city.id, artist_id: @artist.id)
end
