class MastersController < ApplicationController
  before_action :set_master, only: [:show,:destroy]
  respond_to :html, :json
  def new
    @master = Master.new
  end
  def destroy
    @master=Master.where(id: params[:@master_ids])
    @master.destroy_all
  end
  def edit
    @master =  Master.find(params[:id])
  end
  def show
    @masters = Master.all
  end
  def create
    @master = Master.new(master_params)

    if @master.save
        flash[:success] = "Master #{@master.name} has been added."
        redirect_to destroy_all_masters_path(@master)
    else
      respond_to do |format|
      format.html { render :new }
      format.json { render json: @master.errors, status: :unprocessable_entity }
    end
  end
  end
  def destroy_all_masters
    @master=Master.where(id: params[:master_ids])
    @master.destroy_all
  end
  def update
    @master = Master.find(params[:id])
    @master.update_attributes(master_params)
    respond_with @master
  end
  def index
    @masters = Master.all
  end
  private
  def master_params
    params.require(:master).permit(:open_time,:close_time,:name,:patronymmic,:surname, :category_id, :new_category_name)
  end
  def set_master
  @master = Master.find(params[:id])
end
end
