require_relative("../db/sql_runner.rb")

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)

    @name = options['name']
    @id = options['id'].to_i

  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    artists = result.map { |artist| Artist.new(artist) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    artist = Artist.new(result[0])
  end

  def self.find_id_by_name(artist_name)
    sql = "SELECT * FROM artists WHERE name = $1"
    values = [artist_name]
    result = SqlRunner.run(sql, values)
    if result.first != nil
      artist = Artist.new(result.first)
      artist_id = artist.id
      return artist_id
    else
      return false
    end

  end

  def self.artist_already_exists(name)
    artists = self.all
    artists.each do |artist|
      if artist.name == name
        return artist.id
      else
        return false
      end
    end
  end

  def delete
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def save
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']
  end

  def update
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def albums
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    albums = result.map { |album| Album.new(album) }
  end



end
