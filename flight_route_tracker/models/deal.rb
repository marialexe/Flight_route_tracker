require_relative('../db/SqlRunner.rb')

class Deal

  attr_reader :id
  attr_accessor :label, :weekday, :month, :discount, :type, :airline_id, :route_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @label = params['label']
    @weekday = params['weekday']
    @month = params['month']
    @discount = params['discount'].to_i
    @type = params['type']
  # coding added when switching from 7 to 5 models approach
    @airline_id = params['airline_id']
    @route_id = params['route_id']
  end

  def save()
    sql = "INSERT INTO deals (label, weekday, month, discount, type, airline_id, route_id) VALUES ('#{@label}', '#{@weekday}', '#{@month}' ,#{@discount}, '#{@type}', #{@airline_id}, #{@route_id}) RETURNING id;"
    array_hashes = SqlRunner.run(sql)
    deal_hash = array_hashes.first()
    @id = deal_hash['id'].to_i
  end

  def airline()
    sql = "SELECT * FROM airlines WHERE id = #{@airline_id};"
    airline_hash = SqlRunner.run(sql).first()
    result = Airline.new(airline_hash)
    return result
  end

  def route()
    sql ="SELECT * FROM flight_routes WHERE id = #{@route_id};"
    route_hash = SqlRunner.run(sql)
    result = FlightRoute.new(route_hash)
    return result
  end

  def update()
    sql = "UPDATE deals SET (label, weekday, month, discount, type, airline_id, route_id) = ('#{@label}', '#{@weekday}', '#{@month}', #{@discount}, '#{@type}', #{@airline_id}, #{@route_id}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end
  def delete()
    sql = "DELETE FROM deals WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  # ----------------Class-methods--------------

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

  def Deal.find(id)
    sql = "SELECT * FROM deals WHERE id = #{id};"
    deal_hash = SqlRunner.run(sql).first()
    result = Deal.new(deal_hash)
    return result
  end

end