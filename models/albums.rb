require_relative("../db/sql_runner.rb")

class Album

  attr_reader :id
  attr_accessor :artist_id, :title, :genre, :quantity, :stock_level

  def initialize(options)

    @id = options['id'].to_i
    @artist_id = options['artist_id']
    @title = options['title']
    @genre = options['genre']
    @quantity = options['quantity'].to_i
    @stock_level = options['stock_level']

  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    artists = result.map { |album| Album.new(album) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    album = Album.new(result[0])
  end

  def delete
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def save
    sql = "INSERT INTO albums (title, genre, quantity, stock_level, artist_id) VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@title, @genre, @quantity, @stock_level, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']
  end

  def update
    sql = "UPDATE albums SET (title, genre, quantity, stock_level, artist_id) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@title, @genre, @quantity, @stock_level, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)
    artist = Artist.new(result[0])
    return artist

  end

end
