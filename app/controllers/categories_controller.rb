class CategoriesController < ApplicationController
	def new		
		@title = "Products"
	    if signed_in?	      	      		
	      @category = Category.new
	      2.times {@category.products.build }                  
	      render 'new'
	    else            
	      flash.now[:error] = "Please sign in first so you can start procurement activities."
	      render 'sessions/new'
	    end
	end

	def create
		@category = Category.find(params[:category])
		if @category.save
			flash.now[:success] = "Added Successfully"
			redirect_to products_path
		else
			render :action => 'new'
		end	
	end
end