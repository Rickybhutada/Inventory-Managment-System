class ProductsController < ApplicationController
  include ProductsHelper

  def index
    @product = Product.get_all_product_with_warehouse_and_count
    @header = ['id', 'sku_code', 'price'] + Warehouse.pluck(:id).map{|i| i.to_s + '_warehouse'} + Warehouse.pluck(:id).map{|i| i.to_s + '_color_red'}
  end
end
