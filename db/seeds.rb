require_relative("../models/artists.rb")
require_relative("../models/albums.rb")

artist1 = Artist.new({'name' => 'E-Z Rollers'})
artist2 = Artist.new({'name' => 'Bad Company UK'})
album1 = Album.new({'title' => 'Walk This Land', 'genre' => 'Drum \'n\' Bass', 'quantity' => 5, 'stock_level' => 'Medium' })
album2 = Album.new({'title' => 'The Nine', 'genre' => 'Drum \'n\' Bass', 'quantity' => 10, 'stock_level' => 'High' })
