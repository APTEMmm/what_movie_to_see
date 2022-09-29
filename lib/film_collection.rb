require 'httparty'
require 'nokogiri'
require_relative 'film'

class FilmCollection
  URL = 'https://www.imdb.com/search/title/?groups=top_250&sort=user_rating'

  def self.from_html
    response_body = HTTParty.get(URL).body

    html = Nokogiri::HTML(response_body)

    films = html.search('//div[@class="lister-item-content"]').map do |node|
      title = node.search('h3/a').text
      director = node.search('p/a').first.text
      year = node.search('h3/span').last.text.delete('()')

      Film.new(title, director, year)
    end
    new(films)
  end

  def initialize(films)
    @films = films
  end

  def directors
    @films.map(&:director).uniq.sample(5)
  end

  def film_by_director(director)
    @films.select { |film| film.director == director }.sample
  end
end
