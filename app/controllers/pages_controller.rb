class PagesController < ApplicationController
  def home
  	@title = "Home"
  end

  def sell
  	@title = "Sell"
  end

  def buy
  	@title = "Buy"
  end

  def contact
  	@title = "Contact"    
    @clientdet = Client.clientdetails(cookies[:clientid])
    @subject = "Ticket #xxxx"
    @problem = "Problem description"    
    if @clientdet.nil?
      @clientname = params[:page][:first_name]+params[:page][:last_name]
      @company = params[:page][:company_name]      
      @phone =  params[:page][:contact_phone]             
    else
      @clientname = @clientdet.first_name
      @company = @clientdet.company_name
      @phone = @clientdet.contact_phone
    end    
  end

  def sendmail
    ClientMailer.requestsupport_email(@clientname,@subject,@problem,@phone).deliver
  end
end
