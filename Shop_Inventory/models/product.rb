require_relative('../db/sql_runner.rb')

class Product

  attr_reader :id
  attr_accessor :product_name, :description, :stock, :buying_cost, :selling_price, :manufacturer_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @product_name = options['product_name']
    @description = options['description']
    @stock = options['stock'].to_i()
    @buying_cost = '%.2f' % options['buying_cost'].to_f()
    @selling_price = '%.2f' % options['selling_price'].to_f()
    @manufacturer_id = options['manufacturer_id'].to_i()
  end

  def save()
    sql = "INSERT INTO products
    (
      product_name,
      description,
      stock,
      buying_cost,
      selling_price,
      manufacturer_id
    )
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@product_name, @description, @stock, @buying_cost, @selling_price, @manufacturer_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i()
  end

  def delete()
    sql = "DELETE FROM products WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM products"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE products SET
    (
      product_name,
      description,
      stock,
      buying_cost,
      selling_price,
      manufacturer_id
    )
    = ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@product_name, @description, @stock, @buying_cost, @selling_price, @manufacturer_id, @id]
    SqlRunner.run(sql, values)
  end

  def manufacturer()
    sql = "SELECT * FROM manufacturers WHERE id = $1"
    values = [@manufacturer_id]
    manufacturers = SqlRunner.run(sql, values)
    return Manufacturer.new(manufacturers.first)
  end

  def self.all()
    sql = "SELECT * FROM products"
    products = SqlRunner.run(sql)
    return products.map { |product| Product.new(product)}
  end

  def self.find(id)
    sql = "SELECT * FROM products WHERE id = $1"
    values = [id]
    products = SqlRunner.run(sql, values)
    return Product.new(products.first)
  end

  def stock_check_underscore ()
    if @stock == 0
      return "Out_of_Stock"
    end
    return @stock > 20 ? "In_Stock" : "Low_Stock"
  end

def stock_check_no_underscore ()
  if @stock == 0
    return "Out of Stock"
  end
  return @stock > 20 ? "In Stock" : "Low Stock. Re-Stock required."
end

end
