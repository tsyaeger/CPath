module ApplicationHelper

	def format_date(date)
		date.strftime("%m/%d/%Y") 
	end

	def error_msg(target)
		content_tag(:div, :id => "error_msg") do
	      render content_tag(:span, options[:true_text], :class => "")
	    end
	end


	def alert_class(flash_type)	
		case flash_type.to_s		
		when :notice			 
			"alert success" 	
		when :alert 	
			"alert warning"	
		when :error 	
			"alert danger"	
		end	
	end



end
