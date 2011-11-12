module SessionsHelper
	def sign_in(client)
		cookies.permanent.signed[:remember_token] = [client.id, client.salt]
		self.current_client = client
	end

	def current_client=(client)
		@current_client = client
	end

	def current_client
		@current_client ||= client_from_remember_token
	end

	def signed_in?
		!current_client.nil?
	end

	def sign_out
		cookies.delete(:remember_token)
		self.current_client = nil
	end

	private
		def client_from_remember_token
			Client.authenticate_with_salt(*remember_token)
		end

		def remember_token
			cookies.signed[:remember_token] || [nil, nil]
		end
end
