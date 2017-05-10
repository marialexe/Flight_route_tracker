require_relative('../db/SqlRunner.rb')

class NewAirline

  attr_reader :id
  attr_accessor :airline_name, :logo

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @airline_name = params['airline_name']
    @logo = params['logo']
  end
# -------------Instance-methods--------------

  def save()
    sql = "INSERT INTO new_airlines (airline_name,logo) VALUES ('#{@airline_name}','#{@logo}') RETURNING id;"
    array_hashes = SqlRunner.run(sql)
    airline_hash = array_hashes.first()
    @id = airline_hash['id'].to_i 
  end

# --------------------------------------------------

  def update()
    sql = "UPDATE new_airlines SET (airline_name, logo) = ('#{@airline_name}','#{@logo}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM new_airlines WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

# ----------------Class-methods--------------

  def NewAirline.delete_all()
    sql = "DELETE FROM new_airlines;"
   SqlRunner.run(sql)
  end

  def NewAirline.all()
    sql = "SELECT * FROM new_airlines;"
    array_hashes = SqlRunner.run(sql)
    result =  array_hashes.map {|hash| NewAirline.new(hash)}
    return result
  end

  def NewAirline.find(id)
    sql = "SELECT * FROM new_airlines WHERE id=#{id};"
    airline_hash = SqlRunner.run(sql).first()
    result =  NewAirline.new(airline_hash)
    return result
  end

end