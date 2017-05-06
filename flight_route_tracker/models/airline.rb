require('pg')

class Airline

  attr_reader :id
  attr_accessor :airline_name, :logo

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @airline_name = params['airline_name']
    @logo = params['logo']
  end

  def save()
    db = PG.connect({dbname: 'flight_tracker', host: 'localhost'})
    sql = "INSERT INTO airlines (airline_name,logo) VALUES ('#{@airline_name}','#{@logo}') RETURNING id;"
    db.exec(sql)
    db.close()
  end

  def Airline.delete_all()
    db = PG.connect({dbname: 'flight_tracker', host: 'localhost'})
    sql = "DELETE FROM airlines;"
    db.exec(sql)
    db.close()
  end

end