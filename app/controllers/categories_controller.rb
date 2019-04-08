class CategoriesController < ApplicationController
  before_action :set_creatures, only: [:show,:destroy,:edit]
  respond_to :html, :json
  def new
  @category = Category.new
  end
  def show
    @masters = @category.masters
    @offers = @category.offers
  end
  def update
  @category = Category.find params[:id]
  @category.update_attributes(category_params)
  respond_with @category
  end
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to root_url}
      format.json { head :no_content }
  end
  end
  def create
    @category = Category.new(category_params)
    if @category.save
        flash[:success] = "category #{@category.name} has been added."
        redirect_to root_path
    end
  end
  private
  def category_params
    params.require(:category).permit(:name)
  end
  def set_creatures
    @category = Category.find(params[:id])
  end
end
