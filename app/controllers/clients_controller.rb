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
     flash[:success] = "Sign up successful! A message will be sent to your email account for verification. Please store your password in a safe place; you are responsible for ensuring that it is not shared with anyone."
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