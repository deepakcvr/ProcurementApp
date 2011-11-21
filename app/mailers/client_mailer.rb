class ClientMailer < ActionMailer::Base
  default from: "deepak.cvr@gmail.com"

  def requestsupport_email(client,subject,problem,phone)  	
  	@client = client
  	@subject = subject
  	@problem = problem
  	@phone = phone
  	mail(:to => "deepak@sokeo.com", :subject => subject)
  end
end
