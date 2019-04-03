class PricesController < ApplicationController
  before_action :authenticate_user!, :only => [:create, :index]
  def create
    if Entry.where(:user_id => current_user.id, :room_id => params[:price][:room_id]).present?
      @price = Price.create(params.require(:price).permit(:user_id, :amount, :room_id).merge(:user_id => current_user.id))
      redirect_to "/rooms/#{@price.room_id}"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    @prices = Price.all
    @total_price = @prices.sum(:amount)
  end
  def show
    prices = Price.where(user_id: current_user)
    prices.sum(:amount)
  end
end
