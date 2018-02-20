require_relative("../db/sql_runner.rb")
require_relative("../models/stock.rb")

class Album

  attr_reader :id
  attr_accessor :artist_id, :title, :genre, :quantity, :buy_price, :sale_price

  def initialize(options)

    @id = options['id'].to_i
    @artist_id = options['artist_id']
    @title = options['title']
    @genre = options['genre']
    @quantity = options['quantity'].to_i
    @buy_price = options['buy_price'].to_i
    @sale_price = options['sale_price'].to_i

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

  def self.find_id_by_title(title)
    sql = "SELECT * FROM albums WHERE title = $1"
    values = [title]
    result = SqlRunner.run(sql, values)
    if result.first != nil
      album = Album.new(result.first)
      return album.id
    else
      return false
    end
  end

  def delete
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def save
    sql = "INSERT INTO albums (title, genre, quantity, artist_id, buy_price, sale_price) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@title, @genre, @quantity, @artist_id, @buy_price, @sale_price]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']
  end

  def update
    sql = "UPDATE albums SET (title, genre, quantity, artist_id) = ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@title, @genre, @quantity, @artist_id, @id, @buy_price, @sale_price]
    SqlRunner.run(sql, values)
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)
    artist = Artist.new(result[0])
    return artist

  end

  # def stock_level
  #   sql = "SELECT * FROM stock WHERE id = $1"
  #   values = [1]
  #   result = SqlRunner.run(sql)
  #   settings = Stock.new(result[0])
  #   if @quantity <= settings.low
  #     return "Low"
  #   elsif @quantity <= settings.medium
  #     return "Medium"
  #   elsif @quantity >= settings.high
  #     return "High"
  #   end
  # end

  def stock_level
      if @quantity <= 1
        return "Low"
      elsif @quantity <= 2
        return "Medium"
      elsif @quantity >= 3
        return "High"
      end
  end

  def mark_up
    return @sale_price - @buy_price
  end

end
