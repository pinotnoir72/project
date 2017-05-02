class Product < ActiveRecord::Base
    has_many :orders
    has_many :comments
end

def self.search(search_term)
  @products = Product.search(search_term)
end