module EventsHelper
	def is_not_linked_to?(creator)
		current_user != creator && check_attendant_user != true
	end

	def check_attendant_user
  	@participants.each do |participant|
  		if participant == current_user
  			return true
  		end
  	end
  end

  def convert_date(datetime)
    DateTime.strptime(datetime.values.join(" "), '%Y %m %d %H %M')
  end
end
