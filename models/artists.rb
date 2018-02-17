class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)

    @name = options['name']
    @id = options['id'].to_i

  end


end
