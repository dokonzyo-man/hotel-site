class ReservationsController < ApplicationController
	def new
    	@hotel = Hotel.find(params[:hotel_id])
    	@reservation = @hotel.reservations.build
	end

	def show
  		@hotel = Hotel.find(params[:id])
  		@reservation = Reservation.find(params[:id])
    end
	def index
    	@hotels = Hotel.all
    	@search = Hotel.ransack(params[:q])
    	@result = @search.result
	end
	def create
		@hotel = Hotel.find(params[:hotel_id])
     	@reservation = Reservation.create(reservation_params)
     	if @reservation.save
     		redirect_to root_path notice:"#{@hotel.name}の予約が完了しました"
     	end
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def reservation_params
		params.require(:reservation).permit(:count, :start_date, :end_date, :hotel_id)
	end
end
