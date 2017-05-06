require_relative('../db/SqlRunner.rb')

class Flight_route

  attr_reader :id
  attr_accessor :origin, :destination, :route, :price

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @origin = params['origin']
    @destination = params['destination']
    @route = params['route'] 
    @price = params['price']
  end

  def save
    sql ="INSERT INTO flight_routes (origin,destination,route,price) VALUES ('#{@origin}', '#{@destination}', '#{@route}', #{price}) RETURNING id;"
    array_hashes = SqlRunner.run(sql)
    flight_route_hash = array_hashes.first()
    @id = flight_route_hash['id'].to_i
  end

  def Flight_route.delete_all()
    sql = "DELETE FROM flight_routes;"
    SqlRunner.run(sql)
  end

  def Flight_route.all()
    sql = "SELECT * FROM flight_routes;"
    array_hashes = SqlRunner.run(sql)
    result = array_hashes.map {|hash| Flight_route.new(hash)}
    return result
  end

end