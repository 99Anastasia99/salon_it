class UsersController < ApplicationController
  before_action :authorize_owner, only: :create
  def create_by_owner
       @user = User.new(manager_params)
       if @user.save
           flash[:success] = "Manager #{@user.name} has been created."
           redirect_to root_path
       end
  end

  private
 def authorize_owner
   return unless !current_user.admin?
 end
  def manager_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
