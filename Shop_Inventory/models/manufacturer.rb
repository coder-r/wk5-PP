require_relative('../db/sql_runner.rb')

class Manufacturer

  attr_reader :id
  attr_accessor :manufacturer_name, :lead_time, :email, :contact_number

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @manufacturer_name = options['manufacturer_name']
    @lead_time = options['lead_time'].to_i()
    @email = options['email']
    @contact_number = options['contact_number']
  end

  def save()
    sql = "INSERT INTO manufacturers
    (
      manufacturer_name,
      lead_time,
      email,
      contact_number
    )
    VALUES ($1, $2, $3, $4)
    RETURNING id"
    values = [@manufacturer_name, @lead_time, @email, @contact_number]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i()
  end

  def delete()
    sql = "DELETE FROM manufacturers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM manufacturers"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE manufacturers SET
    (
      manufacturer_name,
      lead_time,
      email,
      contact_number
    )
    = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@manufacturer_name, @lead_time, @email, @contact_number, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM manufacturers"
    manufacturers = SqlRunner.run(sql)
    return manufacturers.map { |manufacturer| Manufacturer.new(manufacturer)}
  end

  def self.find(id)
    sql = "SELECT * FROM manufacturers WHERE id = $1"
    values = [id]
    manufacturers = SqlRunner.run(sql, values)
    return Manufacturer.new(manufacturers.first())
  end

end
