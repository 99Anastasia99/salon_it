class OffersController < ApplicationController
  before_action :set_offer, only: [:show,:edit,:destroy]
  respond_to :html, :json
  def new
    @offer = Offer.new
  end
  def destroy_all_offers
    @offer= Offer.where(id: params[:offer_ids])
    @offer.destroy_all
    redirect_to offers_path
  end
  def edit
  end
  def update
    @offer = Offer.find(params[:id])
    @offer.update_attributes(offer_params)
    redirect_to offers_path
  end
  def create
    @offer = Offer.new(offer_params)
    if @offer.save
        flash[:success] = "offer #{@offer.name} has been added."
        redirect_to offers_path
      else
        respond_to do |format|
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
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
