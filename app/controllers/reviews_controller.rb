class ReviewsController < ApplicationController
	def index
    	@hotel = Hotel.find(params[:hotel_id])
    	@reviews = @hotel.reviews
	end
	def show
  	@hotel = Hotel.find(params[:hotel_id])
  	@review = Review.find(params[:id])
	end

	def destroy
  	@hotel = Hotel.find(params[:hotel_id])
  	@review = Review.find(params[:id])
  	if @review.destroy
    		redirect_to hotel_path(@hotel)
  	end
	end
	def new
  	@hotel = Hotel.find(params[:hotel_id])
  	@review = @hotel.reviews.build
	end

	def create
  	@hotel = Hotel.find(params[:hotel_id])
  	@review = Review.new(review_params)
  	if @review.save
    		redirect_to hotel_path(@hotel)
  	end
	end

	def review_params
  	params.require(:review).permit(:name, :title, :rating, :opinion, :hotel_id)
	end
	def edit
  	@hotel = Hotel.find(params[:hotel_id])
  	@review = Review.find(params[:id])
	end

	def update
  	@hotel = Hotel.find(params[:hotel_id])
  	@review = Review.find(params[:id])
  	if @review.update(review_params)
    		redirect_to hotel_path(@hotel)
  	end
	end
end
