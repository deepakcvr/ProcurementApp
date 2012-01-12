class CategoriesController < ApplicationController
	def index
		
	end

	def show
		@category = Category.all
	end

	def new		
		@title = "Products"
	    if signed_in?	      	      		
	      @category = Category.new
	      #@plist = Product.find_all_by_category_id(params[:selectedcategory])
	      1.times {@category.products.build }                  
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
	
	def edit
	end
	
	def update
	end
	
	def destroy
	end	

	def add_products
	    @products = Product.find_all_by_category_id(params[:category_id])	    
		respond_to do |format|
		  format.js
	end
end
end