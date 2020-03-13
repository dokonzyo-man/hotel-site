class HotelsController < ApplicationController
	def index
    	# @prefecture = Prefecture.find(params[:prefecture_id])
		@hotels = Hotel.all
    	# @hotel = Hotel.find(params[:id])
    	# @reservation = Reservation.find(params[:id])
    	@reservations = Reservation.all
    	@q = Hotel.ransack(params[:q]) 
    	@hotels = @q.result(distinct: true)
	end
	def show
    	# @reservation = Reservation.find(params[:id])
  		@hotel = Hotel.find(params[:id])
    	@reviews = @hotel.reviews
  	end
  	def new
  		@hotel = Hotel.new
  	end

	def create
  		@hotel = Hotel.new(hotel_params)

  		if @hotel.save
    		redirect_to hotels_path
  	end
	end

	def hotel_params
  		params.require(:hotel).permit(:name, :description, :picture, :nearby, :hotel_id)
	end
	def edit
  		@hotel = Hotel.find(params[:id])
	end

	def update
  		@hotel = Hotel.find(params[:id])
  		@hotel = @hotel.update(hotel_params)
  		redirect_to hotels_path
	end
end
