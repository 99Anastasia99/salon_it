class MastersController < ApplicationController
  before_action :set_master, only: [:show,:destroy]
  respond_to :html, :json
  def new
    @master = Master.new
  end
  def destroy
    @master.destroy
end
  def create
    @master = Master.new(master_params)
    if @master.save
        flash[:success] = "Master #{@master.name} has been added."
        redirect_to root_path
    end
  end
  def index
    @masters = Master.all
  end
  private
  def master_params
    params.require(:master).permit(:name,:patronymmic,:surname, :category_id, :new_category_name, :working_hours_id, :day_of_week,:open, :close)
  end
  def set_master
  @master = Master.find(params[:id])
end
end
