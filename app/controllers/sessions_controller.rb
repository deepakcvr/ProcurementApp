class SessionsController < ApplicationController
  def new
  end

  def create
  	client = Client.authenticate(params[:session][:username], params[:session][:password])
  	if client.nil?
  		flash.now[:error] = "Incorrect Login / Password; please re-try. Your account will be locked after 3 unsuccessful attempts."
  		@title = "Sign In"
  		render 'new'
  	else
  		sign_in client
  		redirect_to root_path
  	end
  end

  def destroy
  	sign_out
  	redirect_to signin_path
  end

end
