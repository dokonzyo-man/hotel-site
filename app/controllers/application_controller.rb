class ApplicationController < ActionController::Base
  before_action :set_search
  before_action :up_search
  before_action :authenticate_user!

  def set_search
    @s = Prefecture.ransack(params[:s])
  	@prefectures = @s.result(distinct: true)
  end
  def up_search
    @q = Hotel.ransack(params[:q])
  	@hotels = @q.result(distinct: true)
  end
end
