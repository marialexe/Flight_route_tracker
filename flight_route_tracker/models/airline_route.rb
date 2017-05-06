require_relative('../db/SqlRunner.rb')

class AirlineRoute

  attr_reader :id
  attr_accessor :airline_id, :route_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @airline_id = params['airline_id'].to_i
    @route_id = params['route_id'].to_i
  end

  def save()
    sql = "INSERT INTO airline_routes (airline_id, route_id) VALUES (#{@airline_id},#{@route_id}) RETURNING id;"
    array_hashes = SqlRunner.run(sql)
    airline_route_hash = array_hashes.first()
    @id = airline_route_hash['id'].to_i
  end

  def AirlineRoute.delete_all()
    sql = "DELETE FROM airline_routes;"
    SqlRunner.run(sql)
  end

  def AirlineRoute.all()
    sql = "SELECT * FROM airline_routes;"
    array_hashes = SqlRunner.run(sql)
    result = array_hashes.map {|hash| AirlineRoute.new(hash)}
    return result
  end

end