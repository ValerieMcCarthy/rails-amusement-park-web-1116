class AttractionsController < ApplicationController

	before_action :authenticate_user

	def index
		@attractions = Attraction.all
	end

	def new
		if authenticate_admin
			@attraction = Attraction.new
		else
			flash[:notice] = "You do not have rights to create new attraction. SORRY!!!"
			redirect_to attractions_path and return
		end
	end

	def show
		@attraction = Attraction.find(params[:id])
	end

	def create
		@attraction = Attraction.new(attraction_params)
		if @attraction.save
			flash[:notice] = "Thank you for adding a new attraction"
			redirect_to attraction_path(@attraction)
		else
			flash[:notice] = "You did not enter valid attraction parameters. Please try again"
			redirect_to new_attraction_path
		end
	end

	def edit
		@attraction = Attraction.find(params[:id])
	end

	def update
		@attraction = Attraction.find(params[:id])
		if @attraction.update(attraction_params)
      		redirect_to attraction_path(@attraction)
      	else
      		flash[:notice] = "You did not enter valid arguments."
      		render :edit
      	end
	end



	def create_ride
			
		@ride = Ride.new
		@user = User.find_by(session[:user_id])
		@ride.user = @user
		@attraction = Attraction.find(params[:id])
		@ride.attraction = @attraction
		
		@result = @ride.take_ride
		

		if @result == "Sorry. You do not have enough tickets the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
		 flash[:notice] =  "You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
		elsif @result == "Sorry. You do not have enough tickets the #{@attraction.name}."

		 flash[:notice] =  "You do not have enough tickets to ride the #{@attraction.name}"

		elsif @result == "Sorry. You are not tall enough to ride the #{@attraction.name}."

		  flash[:notice] =  "Sorry. You are not tall enough to ride the #{@attraction.name}."
		elsif @result == "Thanks for riding the #{@attraction.name}!"
		  flash[:notice] = "Thanks for riding the #{@attraction.name}!"
		else
			flash[:notice] = "Something bad went wrong!!!!!!"
		end
     



		redirect_to user_path(@user)
	end







	private

	def attraction_params
      params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
    end

end