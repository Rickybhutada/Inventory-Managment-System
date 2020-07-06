class StocksController < ApplicationController
  def edit
    product_id = params[:id]
    warehouse_id = Warehouse.find_warehouse_id(DEFAULT_WAREHOUSE)
    @stock = Stock.find_by_product_and_warehouse(product_id, warehouse_id)
  end

  def update
    stock = get_stock_details(params[:stock][:product_id], params[:stock][:warehouse_id])
    stock.update(stock_params)
    redirect_to root_path, notice: 'Product updated successfully'
  end

  def get_stock
    stock = get_stock_details(params[:product_id], params[:warehouse_id])
    render json: stock
  end

  private

  def stock_params
    params.require(:stock).permit(:item_count, :low_item_threshold)
  end

  def get_stock_details(product_id, warehouse_id)
    Stock.find_by_product_and_warehouse(product_id, warehouse_id)
  end
end
