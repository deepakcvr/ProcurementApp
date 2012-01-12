class Category < ActiveRecord::Base
	has_many :products
	
	#attr_accessor :selectedcategoryid		

	def product_attributes=(product_attributes)
		product_attributes.each do |attributes|
			products.build(attributes)
		end 
	end

	def self.search(query)
    	where("name like ?", "%#{query}%")
  	end
end