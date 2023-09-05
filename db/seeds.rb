# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

fictional_chars = [
  {
    name: 'Date Mike',
    age: 47,
    enjoys: 'Playing pool and wearing a Kangol hat and impressing chicks',
    image: 'https://i.redd.it/voer03gdaj911.png'
  },
  {
    name: 'Prison Mike',
    age: 47,
    enjoys: 'Eating gruel',
    image: 'https://static.wikia.nocookie.net/theoffice/images/9/96/Prisonmike.png/revision/latest?cb=20100327171549'
  },
  {
    name: 'Michael Scarn',
    age: 47,
    enjoys: 'If I told you I would have to kill you',
    image: 'https://m.media-amazon.com/images/M/MV5BZDEzNmUyM2MtNzQ1OC00ZDNhLTgwM2MtODBkZDdiNTQ1ODc0XkEyXkFqcGdeQXVyMzA5OTMzMjg@._V1_.jpg'
  },
  {
    name: 'Joey Tribbiani',
    age: 38,
    enjoys: 'Food, hanging out with friends, food, eating Monicas food, baloney, pastrami, food. '
  }
]

fictional_chars.each do |each_char|
  FictionalChar.create each_char
  puts "creating char #{each_char}"
end