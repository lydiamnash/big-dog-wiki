require 'rails_helper'
describe Categorization do
  let(:creator) {User.new(username: "paper", email: "rock@gmail.com", password: "123")}
  let(:article) {Article.new(creator: creator)}
  let(:category) {Category.new(name: "poops")}
   let(:editor) {User.new(username: "pape", email: "rocs@gmail.com", password: "1234")}
  let(:version) {Version.new(title: "dumb", content: "worse", article: article, editor: editor)}
    let(:categorization) {Categorization.new(category: category, version: version)}


  it 'has a category' do
    expect(categorization.category).to eq category
  end

  it 'has a version' do
    expect(categorization.version).to eq version
  end
end
