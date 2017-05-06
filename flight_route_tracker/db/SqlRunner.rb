require('pg')

class SqlRunner

  def SqlRunner.run(sql)
    begin
      db = PG.connect({dbname: 'flight_tracker', host: 'localhost'})
      array_hashes = db.exec(sql)
    ensure
      db.close()
    end
    return array_hashes
  end

end