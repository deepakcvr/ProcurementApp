module ApplicationHelper
	#Return base title if no title is available for a page.
	def title
		base_title = "Procurement Software Product"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
end
