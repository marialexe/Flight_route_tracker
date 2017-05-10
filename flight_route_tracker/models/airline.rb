require_relative('../db/SqlRunner.rb')

class Airline

  attr_reader :id
  attr_accessor :airline_name, :logo

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @airline_name = params['airline_name']
    @logo = params['logo']
  end
# -------------Instance-methods--------------

  def save()
    sql = "INSERT INTO airlines (airline_name,logo) VALUES ('#{@airline_name}','#{@logo}') RETURNING id;"
    array_hashes = SqlRunner.run(sql)
    airline_hash = array_hashes.first()
    @id = airline_hash['id'].to_i 
  end

  def deal()
    sql = "SELECT * FROM deals WHERE airline_id = #{@id};"
    array_hashes = SqlRunner.run(sql)
    result = array_hashes.map {|hash| Deal.new(hash)}
    return result
  end

  def route()
    sql = "SELECT fr.* FROM flight_routes fr INNER JOIN deals d ON fr.id = d.route_id INNER JOIN airlines a ON a.id = d.airline_id WHERE a.id = #{@id};"
    array_hashes = SqlRunner.run(sql)
    result = array_hashes.map {|hash| FlightRoute.new(hash)}
    return result
  end

  def update()
    sql = "UPDATE airlines SET (airline_name, logo) = ('#{@airline_name}','#{@logo}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM airlines WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

# ----------------Class-methods--------------

  def Airline.delete_all()
    sql = "DELETE FROM airlines;"
   SqlRunner.run(sql)
  end

  def Airline.all()
    sql = "SELECT * FROM airlines;"
    array_hashes = SqlRunner.run(sql)
    result =  array_hashes.map {|hash| Airline.new(hash)}
    return result
  end

  def Airline.find(id)
    sql = "SELECT * FROM airlines WHERE id=#{id};"
    airline_hash = SqlRunner.run(sql).first()
    result =  Airline.new(airline_hash)
    return result
  end

end