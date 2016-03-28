# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

3.times do 

  user = User.create!(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "password", clearance: "editor")

    3.times do
      article = Article.create!(title: Faker::Lorem.word, content: Faker::Lorem.paragraph(2), published: true, editor: user)
        
      3.times do
        article.sources.create!(url: Faker::Internet.url)
      end

      3.times do
        article.categories.create!(name: Faker::StarWars.planet)
      end

    end

end

User.create!(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "password", clearance: "admin")


#  NEED TO ADD IMAGE SEEDS