# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Warehouse with the default and generated values
['Mumbai', 'Banglore', 'New Delhi'].each do |city|
  city_alias = city[0..2]
  wh_code_generated = 0
  loop do
    number = rand(1..999999999)
    wh_code_generated = number.to_s + city_alias
    break unless Warehouse.find_by(wh_code: wh_code_generated)
  end
  pincode_generated = rand(100000..999999)
  max_capacity_default = 100000
  warehouse = Warehouse.find_or_initialize_by(name: city)
  warehouse.wh_code = wh_code_generated
  warehouse.pincode = pincode_generated
  warehouse.max_capacity = max_capacity_default
  warehouse.save
end

# Create product with the default price
[ 'ATMMusic',
  'ATMbot',
  'Abundance',
  'Acclimaze',
  'Acclimite',
  'Accountant Monte Cristo',
  'Accruex',
  'Accufarm',
  'Accugel',
  'Accumax',
  'Accupharm',
  'Accuprint',
  'Accusage',
  'Achy Breaky Chatterbox',
  'Aclima',
  'Action Floss',
  'Action Floss Figure',
  'Action Link',
  'Active Radio',
  'Active Sleep',
  'Active Taco Digestive Cream',
  'AcuVirt',
  'Astro Gin',
  'AstroKnots',
  'AppleVinegar',
  'AddVice',
  'Adornica',
  'Advanced Aluminum Siding',
  'Advanced Calculation Engine',
  'Advarnish',
  'Advertis Miss',
  'ADvise',
  'Aerosol Cheese',
  'Aerosol Jesus',
  'Aesthetic Bug Gloss',
  'Affluential',
  'Affluex',
  'Aftertizer',
  'Agriox',
  'Air Apparent',
  'Austex',
  'AutoMain',
  'Autoconsole',
  'Avenetro',
  'AzoFlux',
  'Airborne Pickle',
  'AirDock',
  'AirHead',
  'Airplex',
  'Airprint',
  'AirSync',
  'Airvoyance',
  'Algae',
  'Indigo',
  'AllBody',
  'AllegroQuote',
  'Allformz',
  'ALLite',
  'AllYear',
  'Alphaplast'].each do |product|
    product_alias = product[0..2]
    sku_code_generated = 0
    loop do
      number = rand(11111..99999)
      sku_code_generated = number.to_s + product_alias
      break unless Product.find_by(sku_code: sku_code_generated)
    end
    price_generated = rand(1000..999999)
    product = Product.find_or_initialize_by(name: product)
    product.sku_code = sku_code_generated
    product.price = price_generated
    product.save
end


# Create stock respective to the warehouse
Warehouse.all.each do |warehouse|
  threshold_difference = 50
  Product.pluck(:id).each_with_index do |product_id, index|
    count_generated = rand(500..999)
    if (warehouse.name == 'Banglore' && index%3 == 0) || (warehouse.name == 'New Delhi' && index%6 == 0)
      threshold = count_generated + threshold_difference
    else
      threshold = count_generated - threshold_difference
    end
    stock = Stock.find_or_initialize_by(warehouse_id: warehouse.id, product_id: product_id)
    stock.item_count = count_generated
    stock.low_item_threshold = threshold
    stock.save
  end
end