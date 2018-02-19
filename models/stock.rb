# require_relative("../db/sql_runner.rb")
#
# class Stock
#
#   attr_reader :id
#   attr_accessor :low, :medium, :high
#
#   def initialize(options)
#     @low = options['low'].to_i
#     @medium = options['medium'].to_i
#     @high = options['high'].to_i
#     @id = options['id'].to_i
#   end
#
#   def save
#     sql = "INSERT INTO stock (low, medium, high) VALUES ($1, $2, $3) RETURNING id"
#     values = [@low, @medium, @high]
#     result = SqlRunner.run(sql, values)
#     @id = result[0]['id']
#   end
# end
