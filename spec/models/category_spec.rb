require 'rails_helper'
describe Category do
  let(:category) {Category.new(name: "yay")}

  it 'has a name' do
    expect(category.name).to eq "yay"
  end
end
