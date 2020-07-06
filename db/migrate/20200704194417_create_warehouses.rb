class CreateWarehouses < ActiveRecord::Migration[6.0]
  def up
    create_table :warehouses do |t|
      t.string :wh_code, unique: true, null: false
      t.string :name
      t.string :pincode
      t.integer :max_capacity
      # t.timestamps
    end
  end

  def down
    drop_table :warehouses
  end
end
