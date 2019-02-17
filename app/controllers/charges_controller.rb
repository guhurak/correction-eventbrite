class ChargesController < ApplicationController
  before_action :authenticate_user!
	def new
    @event = Event.find(params[:event_id])
    @attendance = nil
    @attendance = Attendance.find_by(event_id: @event.id, user_id: current_user.id)
	end  
end
