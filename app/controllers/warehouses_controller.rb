class WarehousesController < ApplicationController
  before_action :check_product, only: :new
  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.create(warehouse_params)
    if @warehouse.persisted?
      @warehouse.create_stock
      redirect_to root_path, :notice => "Warehouse Created Successfully"
    else
      render :new
    end
  end

  private
  def warehouse_params
    params.require(:warehouse).permit(:name, :wh_code, :max_capacity, :pincode)
  end

  def check_product
    redirect_to root_path, :alert => "Sorry there are no product, Please create Product first" unless Product.any?
  end
end
