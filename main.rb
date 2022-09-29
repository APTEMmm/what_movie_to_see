require_relative 'lib/film'
require_relative 'lib/film_collection'

films = FilmCollection.from_html

directors = films.directors

random_directors = {}
directors.each.with_index(1) do |director, index|
  puts "#{index}. #{director}"
  random_directors[index] = director
end

puts 'Фильм какого режиссера вы хотите сегодня посмотреть?'
answer = gets.chomp
until ('1'..directors.size.to_s).include?(answer)
  puts "Введите число от 1 до #{directors.size}"
  answer = gets.chomp
end

chosen_director = random_directors[answer.to_i]

film = films.film_by_director(chosen_director)
puts film
