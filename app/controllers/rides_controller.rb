class RidesController < ApplicationController


	def new
	end

	def create
		@ride = Ride.new
		@user = User.find_by(session[:user_id])
		@ride.user = @user
		@attraction = Attraction.find_by(params[:id])
		@ride.attraction = @attraction

		if @user.take_ride
			@ride.save
		end
		#flash[:notice]
		redirect to attractions_path
		end

		
	end

end