class Category < ActiveRecord::Base
	has_many :products		

	def product_attributes=(product_attributes)
		product_attributes.each do |attributes|
			products.build(attributes)
		end 
	end
end