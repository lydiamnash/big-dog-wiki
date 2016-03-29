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
      content_join = "<img src='#{Faker::Avatar.image}'>"
      article_title = Faker::Lorem.word
      for i in 1..5
        faker_word = Faker::Hipster.word
        custom_content_sec = faker_word
        custom_content = Faker::Hipster.paragraph(2)
        content_join = content_join + "<h3>#{custom_content_sec}</h3> <div>#{custom_content}</div>"
      end

      article = Article.create!(title: article_title, content: content_join, published: true, editor: user)

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