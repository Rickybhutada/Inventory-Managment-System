class Product < ActiveRecord::Base
  has_many :stocks, dependent: :destroy

  def self.get_all_product_with_warehouse_and_count
    collection = Array.new
    Stock.filter_by_product.each_pair do |key, value|
      row  = Product.find(key).slice('id','sku_code', 'price')
      value_hash = value.collect{|i| [i.warehouse_id.to_s + '_warehouse', i.item_count]}.to_h
      value_hash1 = value.collect{|i| [i.warehouse_id.to_s + '_color_red', i.item_count < i.low_item_threshold]}.to_h
      row.merge!(value_hash)
      row.merge!(value_hash1)
      collection.push(row)
    end
    collection
  end
end
