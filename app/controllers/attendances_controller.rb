class AttendancesController < ApplicationController
	
	before_action :authenticate_user!

	def create
		a = Attendance.new(event_id: params[:event_id], user_id: current_user.id, stripe_customer_id: params[:customer_id])

		if a.save

			@amount = Event.find(params[:event_id]).price * 100

			customer = Stripe::Customer.create(
    		:email => params[:stripeEmail],
    		:source  => params[:stripeToken]
  		)

  		charge = Stripe::Charge.create(
    		:customer    => customer.id,
    		:amount      => @amount,
    		:description => 'Rails Stripe customer',
    		:currency    => 'usd'
  		)

			redirect_to event_path(params[:event_id])
			flash[:success] = "Nous avons enregistré votre inscription à #{Event.find(params[:event_id]).title}.\n Un mail de confirmation a été envoyé à #{current_user.email}"
		else
			flash[:danger] = "Un problème est survenu"
			render :new
		end
	end
end
