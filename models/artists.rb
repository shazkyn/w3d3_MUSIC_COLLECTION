require_relative('../db/sqlrunner')

class Artist

  attr_accessor :name, :last_name
  attr_reader  :id

  def initialize(options)
  @name = options['name']
  @last_name = options['last_name']
  @id = options['id'].to_i if options['id']
  end

  def save()
  sql = "INSERT INTO artists
        (name, last_name)
        VALUES
         ($1, $2) RETURNING *"
  values = [@name, @last_name]
  @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def delete()
  sql = "DELETE FROM artists WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE artists
            SET
            (
              first_name, last_name
            ) = (
              $1, $2
            )
            WHERE id = $3
              "
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def Album()
    sql = "SELECT * FROM albums
          WHERE
          artist_id = $1
          "
    values = [@id]
    list = SqlRunner.run(sql, values)
    return list.map { |albums| Albums.new(album)}
  end

  def Artist.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artist.map{ |artist| Artist.new(artist)}
  end

  def Artist.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)

  end

end
