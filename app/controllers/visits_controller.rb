class VisitsController < ApplicationController
    respond_to :html, :json
  def new
    @visit = Visit.new
  end
  def index
    redirect_to new_visit_path
  end
  def create
    @visit = Visit.new(visit_params)
    client_id = @visit.client_id unless @visit.client_id.blank?
    @client = Client.find(client_id) unless @visit.client_id.blank?
    if @visit.save
        flash[:success] = "Visit for has been added."
        redirect_to client_path(id: client_id)
    else
      respond_to do |format|
      format.html { render :new }
      format.json { render json: @visit.errors, status: :unprocessable_entity }
    end
    end
  end

  def destroy_all_visits
    @visit= Visit.where(id: params[:visit_ids])
    @visit.destroy_all
    redirect_to clients_path
  end
private
  def visit_params
    params.require(:visit).permit(:offers_list,:total_price,:date_of_visit, :client_id, :master_id)
  end
end
