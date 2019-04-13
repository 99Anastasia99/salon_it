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
  def index
  @clients = Client.order(sort_column + " " + sort_direction)
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
  def sort_column
    Client.column_names.include?(params[:sort]) ? params[:sort] : "surname"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
