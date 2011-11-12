class ClientsController < ApplicationController
  def index

  end

  def show

  end

  def new
  	@title = "Sign Up"
  	@client = Client.new
  end

  def create
  	@client = Client.new(params[:client])
  	if @client.save
     sign_in @client
     flash[:success] = "Congratulations! You have been successfully registered."
  	 redirect_to signin_path 
    else
      render :action => "new"
    end
  end

  def edit    
  end

  def update    
  end

  def destroy
  end

end
