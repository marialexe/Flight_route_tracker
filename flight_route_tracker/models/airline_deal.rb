require_relative('../db/SqlRunner.rb')

class AirlineDeal

  attr_reader :id
  attr_accessor :airline_id, :deal_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @airline_id = params['airline_id'].to_i
    @deal_id = params['deal_id'].to_i
  end

  def save
    sql = "INSERT INTO airline_deals (airline_id, deal_id) VALUES (#{@airline_id},#{@deal_id}) RETURNING id;"
    array_hashes = SqlRunner.run(sql)
    airline_deal_hash = array_hashes.first()
    @id = airline_deal_hash['id'].to_i
  end

  def AirlineDeal.delete_all()
    sql = "DELETE FROM airline_deals;"
    SqlRunner.run(sql)
  end

  def AirlineDeal.all()
    sql ="SELECT * FROM airline_deals;"
    array_hashes = SqlRunner.run(sql)
    result = array_hashes.map {|hash| AirlineDeal.new(hash)}
    return result
  end

end