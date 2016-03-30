require 'rails_helper'
describe Version do
  let(:creator) {User.new(username: "paper", email: "rock@gmail.com", password: "123")}
  let(:article) {Article.new(creator: creator)}
  let(:category) {Category.new(name: "poops")}
  let(:editor) {User.new(username: "pape", email: "rocs@gmail.com", password: "1234")}
  let(:version) {Version.new(title: "dumb", content: "worse", article: article, editor: editor)}

  it 'has a title' do
    expect(version.title).to eq "dumb"
  end

  it 'has content' do
    expect(version.content).to eq "worse"
  end

  it 'is unpublished by default' do
    expect(version.published).to be false
  end

  it 'has an article' do
    expect(version.article).to eq article
  end

  it 'has an editor' do
    expect(version.editor).to eq editor
  end
end
