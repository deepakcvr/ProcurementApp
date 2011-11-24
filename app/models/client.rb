require 'digest'
class Client < ActiveRecord::Base
	attr_accessor :password
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	password_regex = /(?=.{8,40})(?=.*\d)(?=.*[a-z A-Z])/	

	validates :password, :presence => true,
						 :format => { :with => password_regex },
						 :confirmation => true	
	before_save :encrypt_password

	validates :login_name, :presence => true,
						   :length => { :maximum => 50 }	
	validates :first_name, :presence => true
	validates :company_name, :presence => true
	validates :contact_email, :presence => true,
							  :format => { :with => email_regex },
							  :uniqueness => { :case_sensitive => false }
	validates :contact_phone, :presence => true
	validates :company_address1, :presence => true
	validates :company_city, :presence => true
	validates :company_state, :presence => true
	validates :company_pincode, :presence => true
	validates :company_country, :presence => true

	# Return true if the user's password matches the submitted password.
	def has_password?(submitted_password)
	  # Compare encrypted_password with the encrypted version of
	  # submitted_password.
	  login_password == encrypt(submitted_password)
	end

	def self.authenticate(loginname, submitted_password)
	    client = find_by_login_name(loginname)
	    return nil  if client.nil?
	    return client if client.has_password?(submitted_password)
  	end

  	def self.authenticate_with_salt(id, cookie_salt)
  		client = find_by_id(id)
  		(client && client.salt) ? client : nil
  	end
  	
  	def self.clientdetails(id)
  		client = find_by_id(id)
  	end  	
	
	private
		def encrypt_password
			self.salt = make_salt unless has_password?(password)
			self.login_password = encrypt(password)
		end	

		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end
		
		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end
		
		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end		
end
