class Stock < ActiveRecord::Base
  belongs_to :warehouse
  belongs_to :product
  attr_accessor :name
  validates_presence_of :low_item_threshold, :item_count

  scope :filter_by_product, -> {all.group_by(&:product_id)}
  scope :find_by_product_and_warehouse, -> (product_id, warehouse_id) {find_by(product_id: product_id, warehouse_id: warehouse_id)}
end
