require('pg')

class SqlRunner

  def self.run( dbname, sql )

    begin
      db = PG.connect( dbname: dbname, host: 'localhost' )
      result = db.exec( sql )
    ensure
      if db == nil
        raise "Failed to create db connection to dbname:#{dbname} on host:#{localhost} :-("
      end
      db.close
    end

    return result
  end

end
