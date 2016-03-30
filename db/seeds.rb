20.times do
  Category.find_or_create_by!(name: Faker::StarWars.planet)
end

3.times do

  user = User.create!(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "password", clearance: "editor")

  3.times do
    article = Article.create!(creator: user)

    3.times do
      Comment.create!(content: Faker::StarWars.quote, user: user, article: article)
    end

    content_join = "<img src='#{Faker::Avatar.image}'>"
    for i in 1..5
      faker_word = Faker::Hipster.word
      custom_content_sec = faker_word
      custom_content = Faker::Hipster.paragraph(2)
      content_join = content_join + "<h3>#{custom_content_sec}</h3> <div>#{custom_content}</div>"
    end

    version = article.versions.create!(title: Faker::Lorem.word, content: content_join, published: true, article: article, editor: user)


    3.times do
      version.sources.create!(url: Faker::Internet.url)
    end

    3.times do
      version.categorizations.create!(category_id: rand(1..10))
    end
  end

end

9.times do

  content_join = "<img src='#{Faker::Avatar.image}'>"
  for i in 1..5
    faker_word = Faker::Hipster.word
    custom_content_sec = faker_word
    custom_content = Faker::Hipster.paragraph(2)
    content_join = content_join + "<h3>#{custom_content_sec}</h3> <div>#{custom_content}</div>"
  end

  version = Version.create!(title: Faker::Lorem.word, content: content_join, published: true, article: Article.find(rand(1..9)), editor: User.find(rand(1..3)) )

  3.times do
    version.sources.create!(url: Faker::Internet.url)
  end

  3.times do
    version.categorizations.create!(category_id: rand(1..10) )
  end
end

Version.create!(title: Faker::Lorem.word, content: Faker::Lorem.paragraph(2), published: false, article: Article.find(1), editor: User.find(rand(1..3)) )

User.create!(username: "bigdog", email: "bigdog@bigdog.bigdog", password: "bigdog", clearance: "admin")
