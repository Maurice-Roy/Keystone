require 'nokogiri'
require 'open-uri'
require 'uri'
require 'json'
require 'byebug'


url = "https://en.wikipedia.org/wiki/America%27s_Favorite_Architecture"
@page = Nokogiri::HTML(open(url))
@info = @page.css("table.wikitable tr")

def fix_url(string)
  url = string.split("/")
  url.pop
  url.delete("thumb")
  url = url.join("/")
end

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
  entry[:style] = "Misc" if entry[:style] == ""
  @style = Style.find_or_create_by(name: entry[:style])
  @city = City.find_or_create_by(name: entry[:city])
  @artist = Artist.find_or_create_by(name: entry[:architect])

  if entry[:picture]
    @picture_url = fix_url(entry[:picture])
  else
    @picture_url = "https://vignette.wikia.nocookie.net/randomstuffstuff/images/4/49/How-to-make-ANYTHING-awesome-face.jpg/revision/latest?cb=20110728020836"
  end
  
  Architecture.create(name: entry[:structure], style_id: @style.id, picture_url: @picture_url, city_id: @city.id, artist_id: @artist.id)
end
