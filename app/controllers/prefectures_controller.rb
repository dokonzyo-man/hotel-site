class PrefecturesController < ApplicationController
	def index
		@prefecture = Prefecture.find(params[:prefecture_id])
	    @prefectures = Prefecture.all
	    @hotels = @prefecture.hotels
	  # @s = Prefecture.ransack(params[:s])
  	  # @prefectures = @s.result(distinct: true)
	end

	def search
	  @s = Prefecture.search(search_params)
	  @prefectures = @s.result(distinct: true)
	end

  	private
  	def search_params
    	params.require(:s).permit!
  	end
end
