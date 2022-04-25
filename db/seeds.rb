# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(email: 'user1@test.com', password: 'password1')
user2 = User.create(email: 'user2@test.com', password: 'password2')

language1 = Language.create(name: 'English')
language2 = Language.create(name: 'Spanish')

5.times do
  Word.create(content: Faker::Lorem.word, language: language1, user: user1)
  Word.create(content: Faker::Lorem.word, language: language1, user: user2)
end

5.times do
  Word.create(content: Faker::Lorem.word, language: language2, user: user1)
  Word.create(content: Faker::Lorem.word, language: language2, user: user2)
end

