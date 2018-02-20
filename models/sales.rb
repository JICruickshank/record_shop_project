require_relative("../db/sql_runner.rb")

class Sale

  attr_reader :id
  attr_accessor :album_id, :sale_quantity, :sale_date

  def initialize(options)
    @id = options['id'].to_i
    @album_id = options['album_id'].to_i
    @sale_quantity = options['sale_quantity'].to_i
    @sale_date = options['sale_date']

  end

  def self.delete_all
    sql = "DELETE FROM sales"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM sales"
    result = SqlRunner.run(sql)
    sales = result.map { |sale| Sale.new(sale) }
  end

  def save
    sql = "INSERT INTO sales (album_id, sale_quantity, sale_date) VALUES ($1, $2, $3) RETURNING id"
    values = [@album_id, @sale_quantity, @sale_date]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']
  end

  def album
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [@album_id]
    result = SqlRunner.run(sql, values)[0]
    album = Album.new(result)
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [album.artist_id]
    result = SqlRunner.run(sql, values)[0]
    artist = Artist.new(result)

  end


end
