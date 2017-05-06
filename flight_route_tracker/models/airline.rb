require_relative('../db/SqlRunner.rb')

class Airline

  attr_reader :id
  attr_accessor :airline_name, :logo

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @airline_name = params['airline_name']
    @logo = params['logo']
  end

  def save()
    sql = "INSERT INTO airlines (airline_name,logo) VALUES ('#{@airline_name}','#{@logo}') RETURNING id;"
    array_hashes = SqlRunner.run(sql)
    airline_hash = array_hashes.first()
    @id = airline_hash['id'].to_i 
  end

  def Airline.delete_all()
    sql = "DELETE FROM airlines;"
   SqlRunner.run(sql)
  end

end