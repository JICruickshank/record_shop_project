require_relative("../models/artists.rb")
require_relative("../models/albums.rb")
require("pry-byebug")

artist1 = Artist.new({'name' => 'E-Z Rollers'})
artist2 = Artist.new({'name' => 'Bad Company UK'})
artist1.save
artist2.save
album1 = Album.new({'title' => 'Walk This Land', 'genre' => 'Drum \'n\' Bass', 'quantity' => 5, 'stock_level' => 'Medium', 'artist_id' => artist1.id })
album2 = Album.new({'title' => 'The Nine', 'genre' => 'Drum \'n\' Bass', 'quantity' => 10, 'stock_level' => 'High', 'artist_id' => artist2.id })
album1.save
album2.save

binding.pry
nil
