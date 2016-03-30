require 'rails_helper'
describe User do
  let(:user) {User.new(username: "paper", email: "rock@gmail.com", password: "123")}
  # let(:user2) {User.create(username: "paper", email: "rock@gmail.com", password: "123")}

  it 'has a username' do
    expect(user.username).to eq "paper"
  end

  it 'has an email' do
    expect(user.email).to eq "rock@gmail.com"
  end

  it 'has a password' do
    expect(user.password).to eq "123"
  end

  it 'has a default clearance' do
    expect(user.clearance).to eq "editor"
  end

  # NOT WORKING AS OF 3/29 6:57PM
  # it 'has a unique username' do
  #   user2 = User.create(username: "paper", email: "rock@gmail.com", password: "123")
  #   p user2.valid?
  #   expect(user2).to be_invalid
  # end
end
