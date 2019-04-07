class MastersController < ApplicationController
  def new
    @master = Master.new
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
    params.require(:master).permit(:name, :category_id, :new_category_name)
  end
end
