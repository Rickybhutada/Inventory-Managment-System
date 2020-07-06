class CreateStocks < ActiveRecord::Migration[6.0]
  def up
    create_table :stocks do |t|
      t.references :warehouse
      t.references :product
      t.integer :item_count
      t.integer :low_item_threshold
      # t.timestamps
    end
    add_index :stocks, [:warehouse_id, :product_id]
  end

  def down
    drop_table :stocks
  end
end
