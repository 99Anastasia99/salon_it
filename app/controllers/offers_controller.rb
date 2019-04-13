class OffersController < ApplicationController
  before_action :set_offer, only: [:show,:destroy]
  respond_to :html, :json
  def new
    @offer = Offer.new
  end
  def destroy
    @offer.destroy
end
  def create
    @offer = Offer.new(offer_params)
    if @offer.save
        flash[:success] = "offer #{@offer.name} has been added."
        redirect_to root_path
    end
  end
  def index
    @offers = Offer.all
  end
  private
  def offer_params
    params.require(:offer).permit(:name,:description,:duration,:price,:master_id, :category_id, :new_category_name)
  end
  def set_offer
  @offer = Offer.find(params[:id])
end
end
