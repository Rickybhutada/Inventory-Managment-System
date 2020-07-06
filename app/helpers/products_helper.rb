module ProductsHelper
  def skip_record_if_is_color_header(header)
    header.include?('_color_red') || header.include?('id')
  end

  def check_product_below_threshold(header, product)
    header.include?('_warehouse') && product[header.gsub('_warehouse','_color_red')]
  end

  def get_warehouse_name(header)
    Warehouse.find_by(id: header.sub('_warehouse','')).name
  end
end
