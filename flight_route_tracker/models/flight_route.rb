require_relative('../db/SqlRunner.rb')

class FlightRoute

  attr_reader :id
  attr_accessor :origin, :destination, :route, :price, :currency

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @origin = params['origin']
    @destination = params['destination']
    @route = params['route'] 
    @price = params['price']
    @currency = params['currency']
  end
# -------------Instance-methods--------------

  def save()
    sql ="INSERT INTO flight_routes (origin, destination, route, price, currency) VALUES ('#{@origin}', '#{@destination}', '#{@route}', #{price},'#{@currency}') RETURNING id;"
    array_hashes = SqlRunner.run(sql)
    flight_route_hash = array_hashes.first()
    @id = flight_route_hash['id'].to_i
  end

  # Coding valid for 7 models approach

  # def airline()
  #   sql = "SELECT a.* FROM airlines a INNER JOIN airline_routes ar ON a.id = ar.airline_id INNER JOIN flight_routes fr ON ar.route_id = fr.id WHERE fr.id = #{@id};"
  #   array_hashes = SqlRunner.run(sql)
  #   result = array_hashes.map {|hash| Airline.new(hash)}
  #   return result
  # end

  # def deal()
  #   sql = "SELECT d.* FROM deals d INNER JOIN route_deals rd ON d.id = rd.deal_id INNER JOIN flight_routes fr ON rd.route_id = fr.id WHERE fr.id = #{@id};"
  #   array_hashes = SqlRunner.run(sql)
  #   result = array_hashes.map {|hash| Deal.new(hash)}
  #   return result
  # end
  # -------------------------------------

  # Refactored coding for 5 models approach
  def airline()
    sql = "SELECT a.* FROM airlines a INNER JOIN deals d ON a.id = d.airline_id INNER JOIN flight_routes fr ON d.route_id = fr.id WHERE fr.id = #{@id};"
    array_hashes = SqlRunner.run(sql)
    result = array_hashes.map {|hash| Airline.new(hash)}
    return result
  end

  def deal()
    sql = "SELECT * FROM deals WHERE route_id = #{@id};"
    array_hashes = SqlRunner.run(sql)
    result = array_hashes.map {|hash| Deal.new(hash)}
    return result
  end
# -------------------------------------

  def update()
    sql = "UPDATE flight_routes SET (origin, destination, route, price, currency) = ('#{@origin}', '#{@destination}', '#{@route}', #{@price}, '#{@currency}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM flight_routes WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

# -------------Class-methods--------------

  def FlightRoute.delete_all()
    sql = "DELETE FROM flight_routes;"
    SqlRunner.run(sql)
  end

  def FlightRoute.all()
    sql = "SELECT * FROM flight_routes;"
    array_hashes = SqlRunner.run(sql)
    result = array_hashes.map {|hash| FlightRoute.new(hash)}
    return result
  end

  def FlightRoute.find(id)
    sql = "SELECT * FROM flight_routes WHERE id = #{id};"
    route_hash = SqlRunner.run(sql).first()
    result = FlightRoute.new(route_hash)
    return result
  end

end