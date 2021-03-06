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
    #add_breadcrumb "Contact", contact_path
    @contact = Page.new
    @clientdet = Client.clientdetails(cookies[:clientid])
    if request.post?
      if @clientdet.nil?
        @contact.first_name = params[:page][:first_name]
        @contact.last_name = params[:page][:last_name]
        @contact.company_name = params[:page][:company_name]        
        @contact.contact_phone = params[:page][:contact_phone]
        @contact.contact_email = params[:page][:contact_email]
      else  
        @contact.first_name = @clientdet.first_name
        @contact.last_name = @clientdet.last_name
        @contact.company_name = @clientdet.company_name        
        @contact.contact_phone = @clientdet.contact_phone
        @contact.contact_email = @clientdet.contact_email
      end
      @contact.problemdesc = params[:page][:problemdesc]      
      if @contact.valid?
        @subject = "Ticket #xxxx"
        #@problem = @contact.problemdesc1<<"\n"<<@contact.problemdesc2<<"\n"<<@contact.problemdesc3
        @problem = @contact.problemdesc
        @clientname = @contact.first_name
        @company = @contact.company_name
        @phone = @contact.contact_phone
        ClientMailer.requestsupport_email(@clientname,@subject,@problem,@phone).deliver
        flash.now[:success] = "Mail sent. Thank you for your interest."
      else                   
      end
    end  	
  end  
end