require('pry')
require_relative('../models/manufacturer.rb')
require_relative('../models/product.rb')


Manufacturer.delete_all()
Product.delete_all()


manufacturer1 = Manufacturer.new(
  {
    'manufacturer_name' => "KTC",
    'lead_time' => 3,
    'email' => "info@ktc.com",
    'contact_number' => "01414295749"
  }
)

manufacturer2 = Manufacturer.new(
  {
    'manufacturer_name' => "TRS",
    'lead_time' => 1,
    'email' => "sales@trs.com",
    'contact_number' => "01414292570"
  }
)

manufacturer1.save()
manufacturer2.save()


product1 = Product.new(
  {
    'name' => "Tikka Masala",
    'description' => "This widely loved North Indian curry is a rich blend of tomato, yogurt and warming garam masala spices like cumin, cinnamon and clove. Simmer with chicken for an authentic Chicken Tikka Masala. Or let its bright citrus notes complement shrimp, paneer or vegetables.",
    'stock' => 76,
    'buying_cost' => 5.5,
    'selling_price' => 6.5,
    'manufacturer_id' => manufacturer1.id
  }
)

product2 = Product.new(
  {
    'name' => "Madras Curry",
    'description' => "The tropical flavors of South India are captured in this zesty sauce from the Chettinad region, near Madras. Deep flavors of black pepper and coriander are balanced with aromatic coconut milk and curry leaves. Make your own authentic Chettinad Chicken or enjoy with lamb, pork or vegetables.",
    'stock' => 55,
    'buying_cost' => 5.3,
    'selling_price' => 6.7,
    'manufacturer_id' => manufacturer2.id
  }
)

product3 = Product.new(
  {
    'name' => "Kashmiri Curry",
    'description' => "Also known as Rogan Josh, this balanced curry comes from the beautiful mountainous state of Kashmir. Hints of nutmeg and mace add depth and balance to the rich tomato flavor. For a traditional Rogan Josh simmer with cubed lamb. Or enjoy this versatile sauce with chicken, chickpeas or vegetables.",
    'stock' => 67,
    'buying_cost' => 5.2,
    'selling_price' => 6.9,
    'manufacturer_id' => manufacturer1.id
  }
)

product4 = Product.new(
  {
    'name' => "Butter Masala",
    'description' => "Mild and buttery with a hint of chili, this sauce is warm and rich and traditionally simmered with chicken. It also goes beautifully with vegetables or shellfish",
    'stock' => 98,
    'buying_cost' => 5.0,
    'selling_price' => 6.0,
    'manufacturer_id' => manufacturer2.id
  }
)

product5 = Product.new(
  {
    'name' => "Jalfrezi",
    'description' => "Jalfrezi is the legacy of Bengali cooks who made satisfying stir-fries from leftovers. Its bright flavor comes from tomato, garam masala and sweet red peppers.",
    'stock' => 9,
    'buying_cost' => 5.1,
    'selling_price' => 6.5,
    'manufacturer_id' => manufacturer1.id
  }
)


product1.save()
product2.save()
product3.save()
product4.save()
product5.save()

binding.pry
nil
