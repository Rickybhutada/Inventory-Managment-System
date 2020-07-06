class Warehouse < ActiveRecord::Base
  has_many :stocks, dependent: :destroy
  validates :name, :wh_code,:max_capacity, :pincode,  presence: true
  validates :name, :wh_code, uniqueness: { case_sensitive: false }
  validates_length_of :wh_code, :within => 4..12
  validates_length_of :pincode, :is => 6

  scope :find_warehouse_id, -> (name)  {find_by(name: name).id}

  def create_stock
    Product.pluck(:id).each do |product_id|
      self.stocks.create(product_id: product_id, item_count: ITEM_COUNT, low_item_threshold: THRESHOLD_COUNT)
    end
  end

end
