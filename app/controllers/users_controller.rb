class UsersController < ApplicationController
	before_action :authenticate_user!
	
	def show
		@user = User.find(params[:id])
    @events = @user.events

    redirect_to user_path(current_user.id) unless current_user == @user
	end



	def edit
		@user = User.find(current_user.id)
	end



	def update
		@user = User.find(current_user.id)

		if @user.update(first_name: params[:first_name], last_name: params[:last_name], description: params[:description])
			redirect_to user_path(@user.id)
			flash[:success] = "Votre profil a bien été mis à jour."
		else
			render :edit
			flash[:danger] = "Un problème est survenu."
		end
	end
end
