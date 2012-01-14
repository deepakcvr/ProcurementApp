class CategoriesController < ApplicationController
	
	def new		
		@title = "Products & Services"
	    if signed_in?	      	      		
	      @category = Category.new
	      #@plist = Product.find_all_by_category_id(params[:selectedcategory])
	      1.times {@category.products.build }                  
	      #render 'new'
	      #redirect_to products_path
	    else            
	      flash.now[:error] = "Please sign in first so you can start procurement activities."
	      render 'sessions/new'
	    end
	end

	def create
		if params[:commit] == "add"
			@category = Category.new(params[:category])					
			if @category.save
				flash[:success] = "Category Added Successfully"
				redirect_to products_path
			else
				render :action => "new"
			end	
		end
	end	

	def add_products
	    @products = Product.find_all_by_category_id(params[:category_id])	    
		respond_to do |format|
		  format.js
		end
	end
end