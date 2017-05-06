require_relative('../db/SqlRunner.rb')

class RouteDeal

  attr_reader :id
  attr_accessor :route_id, :deal_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @route_id = params['route_id'].to_i
    @deal_id = params['deal_id'].to_i
  end

  def save()
    sql = "INSERT INTO route_deals (route_id, deal_id) VALUES (#{@route_id}, #{@deal_id}) RETURNING id;"
    array_hashes = SqlRunner.run(sql)
    route_deal_hash = array_hashes.first()
    @id = route_deal_hash['id'].to_i
  end

  def RouteDeal.delete_all()
    sql = "DELETE FROM route_deals;"
    SqlRunner.run(sql)
  end

  def RouteDeal.all()
    sql = "SELECT * FROM route_deals;"
    array_hashes = SqlRunner.run(sql)
    result = array_hashes.map {|hash| RouteDeal.new(hash)}
    return result
  end

end