require 'rails_helper'
describe Source do
  let(:creator) {User.new(username: "paper", email: "rock@gmail.com", password: "123")}
  let(:article) {Article.new(creator: creator)}
  let(:category) {Category.new(name: "poops")}
  let(:editor) {User.new(username: "pape", email: "rocs@gmail.com", password: "1234")}
  let(:version) {Version.new(title: "dumb", content: "worse", article: article, editor: editor)}
  let(:source) {Source.new(url: "http://lsdkjflaskdjf.com", version: version)}


  it 'has a url' do
    expect(source.url).to eq "http://lsdkjflaskdjf.com"
  end

  it 'has a version' do
    expect(source.version).to eq version
  end
end
