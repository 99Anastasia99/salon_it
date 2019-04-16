class UsersController < ApplicationController
  before_action :authorize_owner, only: :create_by_owner
  before_action :set_user, only: [:show,:destroy]
  respond_to :html,:json
  def create_by_owner
       @user = User.new(manager_params)
       if @user.save
           flash[:success] = "Manager #{@user.name} has been created."
           redirect_to root_path
         else
           respond_to do |format|
           format.html { render :new }
           format.json { render json: @user.errors, status: :unprocessable_entity }
         end
       end
  end
  def new
  end
  def show
  end
  def update
    @user = User.find(params[:id])
    @user.update_attributes(manager_params)
    respond_with @user
  end
  def destroy
  @user.destroy
  respond_to do |format|
    format.html { redirect_to users_url, notice: 'Менеджер был удалён' }
    format.json { head :no_content }
  end
  end
  def index
  end
  def destroy_all
    @user=User.where(id: params[:user_ids])
    @user.destroy_all
  end
  private
 def authorize_owner
   return unless !current_user.admin?
 end
  def manager_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
def params_edit
  params[:commit]
end
def set_user
  @user = User.find(params[:id])
end
end
