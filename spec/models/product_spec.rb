require 'rails_helper'

describe Product do
  
  context "when the product has comments" do
    #let(:product) {Product.create!(name: "Stegosaurus")}
    #let(:user) {User.create!(email: "email@rspec.com", password: "unittest")}
    #product = FactoryGirl.create(:product)
    #user = FactoryGirl.create(:user)
    
    before do
      product.comments.create!(rating: 5, user: user, body: "Spikey beast of awesome!")
      product.comments.create!(rating: 3, user: user, body: "Meh. It's alright.")
      product.comments.create!(rating: 1, user: user, body: "Can't play fetch.")
    end
    
    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end
    
    it "is not valid without a name" do
      expect(Product.new(description:"what is this?")).not_to be_valid
    end
  end
  
end