class Product < ActiveRecord::Base
    has_many :orders
end

def self.search(search_term)
  @products = Product.search(search_term)
end