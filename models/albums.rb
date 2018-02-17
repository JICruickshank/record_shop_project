require_relative("../db/sql_runner.rb")

class Album

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

  def save
    sql = "INSERT INTO albums (title, genre, quantity, stock_level, artist_id) VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@title, @genre, @quantity, @stock_level, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']

  end


end
