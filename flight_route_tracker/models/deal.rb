require_relative('../db/SqlRunner.rb')

class Deal

  attr_reader :id
  attr_accessor :label, :weekday, :month, :discount, :type

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @label = params['label']
    @weekday = params['weekday']
    @month = params['month']
    @discount = params['discount'].to_i
    @type = params['type']
  end

  def save
    sql = "INSERT INTO deals (label, weekday, month, discount, type) VALUES ('#{@label}', '#{@weekday}', '#{@month}' ,#{@discount}, '#{@type}') RETURNING id;"
    array_hashes = SqlRunner.run(sql)
    deal_hash = array_hashes.first()
    @id = deal_hash['id'].to_i
  end

  def Deal.delete_all()
    sql = "DELETE FROM deals;"
    SqlRunner.run(sql)
  end

  def Deal.all()
    sql = "SELECT * FROM deals;"
    array_hashes = SqlRunner.run(sql)
    result = array_hashes.map {|hash| Deal.new(hash)}
    return result
  end

end