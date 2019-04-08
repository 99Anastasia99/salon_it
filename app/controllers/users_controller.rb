class UsersController < ApplicationController
  before_action :authorize_owner, only: :create_by_owner
  before_action :set_user, only: [:show,:destroy]
  def create_by_owner
       @user = User.new(manager_params)
       if @user.save
           flash[:success] = "Manager #{@user.name} has been created."
           redirect_to root_path
       end
  end
  def new
  end
  def show
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
  def manager_edit_multiple
    @user=User.where(id: params[:users_id])
   if params_edit == t('common.destroy')
   @user.destroy_all
  elsif params_edit == t('common.lock')
  @user.each {|user_to_lock| user_to_lock.lock_access! }
  elsif params_edit == t('common.unlock')
  @user.each {|user_to_unlock| user_to_unlock.unlock_access!}
  end
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
