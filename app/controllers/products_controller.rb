class ProductsController < ApplicationController	
	def index
		
	end

	def show
		@product = Product.all
	end

	def new		
		@title = "Products"	    
	end

	def create		
	end
	
	def edit
	end
	
	def update
	end
	
	def destroy
	end	
end
