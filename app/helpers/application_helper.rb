module ApplicationHelper
	def logo_image_url
		image_path('FamTimeLogo.png')
	end

	def slide_image_url1
		image_path('happy1.jpg')
	end

	def slide_image_url2
		image_path('happy2.jpg')
	end

	def slide_image_url3
		image_path('happy3.jpg')
	end

	def default_user_image
		image_path('default-user-image.png')
	end

	#display flash messages with bootstrap stylin
	def bootstrap_class_for flash_type
		{ success: 'alert-success', error: 'alert-danger', notice: 'alert-warning'}[flash_type.to_sym]
	end

	def flash_messages(opts = {})
		flash.map do |msg_type, message|
			content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do
				content_tag(:button, 'x'.html_safe, class: 'close', data: {dismiss: 'alert'}) + message
			end
		end.join.html_safe
	end
end
