require 'rails_helper'
describe Article do
  let(:creator) {User.new(username: "paper", email: "rock@gmail.com", password: "123")}
  let(:article) {Article.new(creator: creator)}


  it 'has a creator' do
    expect(article.creator).to eq creator
  end
end
