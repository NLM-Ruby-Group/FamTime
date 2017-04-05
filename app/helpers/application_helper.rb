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

  def how_it_work_location_image_url
    image_path('location.png')
  end

  def how_it_work_event_image_url
    image_path('event.png')
  end

  def how_it_work_community_image_url
    image_path('community.png')
  end

	def default_user_image
		image_path('default-user-image.png')
	end

#CAROUSEL ON EVENTINDEX PAGE
	def event_index_url1
		image_path('event-index1')
	end

	def event_index_url2
		image_path('event-index2')
	end

	def event_index_url3
		image_path('event-index3')
	end

	#CAROUSEL ON PLACE INDEX PAGE
	def place_index_url1
		image_path('place-index1')
	end

	def place_index_url2
		image_path('place-index2')
	end

	def place_index_url3
		image_path('place-index3')
	end


	#STAR ICON FOR RATING
def star_icon
	image_path('star-icon')
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
