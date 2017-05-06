require_relative('../db/SqlRunner.rb')

class Customer

  attr_reader :id
  attr_accessor :customer_name, :budget, :currency

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @customer_name = params['customer_name']
    @budget = params['budget'].to_i
    @currency = params['currency']
  end

  def save
    sql = "INSERT INTO customers (customer_name, budget, currency) VALUES ('#{@customer_name}', #{@budget}, '#{@currency}') RETURNING id;"
    array_hashes = SqlRunner.run(sql)
    customer_hash = array_hashes.first()
    @id = customer_hash['id'].to_i
  end

  def Customer.delete_all()
    sql ="DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def Customer.all()
    sql ="SELECT * FROM customers;"
    array_hashes = SqlRunner.run(sql)
    result = array_hashes.map {|hash| Customer.new(hash)}
    return result
  end

end