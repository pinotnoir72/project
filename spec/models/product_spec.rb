require 'rails_helper' 

describe Product do
	context "when the product has comments" do
		let(:product) { Product.create!(name: "wooden table") }
		let(:user) { @user = FactoryBot.create(:user) }

		before do
		  product.comments.create!(rating: 1, user: user, body: "Awful Table!")
		  product.comments.create!(rating: 3, user: user, body: "Nice Table!")
		  product.comments.create!(rating: 5, user: user, body: "Amazing Table!")
		end

		it "returns the average rating of all comments" do
			expect(product.average_rating).to eq 3
		end

		it "is not valid without a name" do
			expect(Product.new(description: "Nice table")).not_to be_valid
		end
	end
end