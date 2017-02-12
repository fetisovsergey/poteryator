module ApplicationHelper
   	# Returns the full title on a per-page basis.
	def full_title(page_title)
	   base_title = "Потерятор" 
	   if page_title.empty?
      		base_title
    	else
      		"#{base_title} | #{page_title}"
    	end
  	end
  	private
  	def current_user?(user)
  		user == current_user
	end
end