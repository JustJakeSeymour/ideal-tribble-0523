# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
studio_2 = Studio.create!(name: 'New Line Cinema', location: 'New York City')
studio_3 = Studio.create!(name: 'Disney', location: 'Studio City')

movie_1 = Movie.create!(name: 'Toy Story', creation_year: '1995', genre: 'animation')
movie_2 = Movie.create!(name: 'Aristocats', creation_year: '1985', genre: 'animation')
movie_3 = Movie.create!(name: 'Lord of the Rings', creation_year: '2000', genre: 'action')
movie_4 = Movie.create!(name: 'Elf', creation_year: '2004', genre: 'holiday')
movie_5 = Movie.create!(name: 'Jurassic Park', creation_year: '1993', genre: 'action')
movie_6 = Movie.create!(name: 'Despicable Me', creation_year: '2010', genre: 'animation')

actor_1 = Actor.create!(name: 'Steve Carell', age: 60)
actor_2 = Actor.create!(name: 'Will Ferell', age: 55)
actor_3 = Actor.create!(name: 'Vigo Mortensen', age: 64)
actor_4 = Actor.create!(name: 'Mike Myers', age: 59)
actor_5 = Actor.create!(name: 'Jeff Goldblum', age: 70)
actor_6 = Actor.create!(name: 'Tom Hanks', age: 66)
