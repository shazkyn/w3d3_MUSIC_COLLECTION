require_relative('../db/sqlrunner')

class Album

  attr_accessor :name, :genre, :artist_id
  attr_reader  :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i if options['artist_id']
    @name = options['name']
    @genre = options['genre']
  end


  def save()
    sql = "INSERT INTO albums
        (artist_id, name, genre)
        VALUES
        ($1, $2, $3) RETURNING * "
      values = [@artist_id, @name, @genre]
      @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def delete()
  sql = "DELETE FROM albums WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
  end


  def update()
    sql = "UPDATE albums
            SET
            (
              name, genre
            ) =
            (
              $1, $2
            )
            WHERE id = $3
          "
    values = [@name, @genre, @artist_id]
    SqlRunner.run(sql, values)
  end


  def Artist()
  sql = "SELECT * FROM artists
        WHERE
        artist_id = $1
        "
  values = [@id]
  list = SqlRunner.run(sql, values)
  return list.map { |albums| Albums.new(album)}
  end


  def Album.all()
  sql = "SELECT * FROM albums"
  artists = SqlRunner.run(sql)
  return artist.map{ |artist| Artist.new(artist)}
  end


  def Album.delete_all()
  sql = "DELETE FROM albums"
  SqlRunner.run(sql)
  end




end
