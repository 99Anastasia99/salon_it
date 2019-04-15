class VisitsController < ApplicationController
    respond_to :html, :json
  def new
    @visit = Visit.new
  end
  def create
    @visit = Visit.new(visit_params)
    client_id = @visit.client_id
    @client = Client.find(client_id)
    if @visit.save
        flash[:success] = "Visit for has been added."
        redirect_to client_path(id: client_id)
    else redirect_to 'new'
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
