class ClientsController < ApplicationController
  before_action :set_client, only: [:show,:destroy]
  def new
    @client = Client.new
  end
  def create
    @client = Client.new(client_params)
    if @client.save
        flash[:success] = "Master #{@client.name} has been added."
        redirect_to root_path
    end
  end
  def update
    @client = Client.find(params[:id])
    @client.update_attributes(client_params)
    respond_with @client
  end
  def index
  @filterrific = initialize_filterrific(
      Client,
      params[:filterrific],
       persistence_id: 'shared_key',
       default_filter_params: {},
       available_filters: [:sorted_by, :average_visits, :average_spending, :search_query],
       sanitize_params: true
        ) or return
     @clients = @filterrific.find.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  rescue ActiveRecord::RecordNotFound => e
  # There is an issue with the persisted param_set. Reset it.
  puts "Had to reset filterrific params: #{e.message}"
  redirect_to(reset_filterrific_url(format: :html)) && return
  end
  def show
  end
  private
  def client_params
    params.require(:client).permit(:name,:patronymic,:surname,:country,:region,:city,:street,:building,:flat,:average_spending,:average_visits,:date_of_birth)
  end
  def set_client
  @client = Client.find(params[:id])
  end
end
