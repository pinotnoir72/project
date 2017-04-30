class Product < ActiveRecord::Base
    has_many :orders
    has_many :comments
end

def self.search(search_term)
<<<<<<< HEAD
  Product.where("name LIKE ?", "%#{search_term}%")
end

def highest_rating_comment
  comments.rating_desc.first
=======
  @products = Product.search(search_term)
>>>>>>> master
end