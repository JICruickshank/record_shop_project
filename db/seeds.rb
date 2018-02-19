require_relative("../models/artists.rb")
require_relative("../models/albums.rb")
require("pry-byebug")

Artist.delete_all
Album.delete_all

artist1 = Artist.new({'name' => 'E-Z Rollers'})
artist2 = Artist.new({'name' => 'Bad Company UK'})
artist1.save
artist2.save
album1 = Album.new({'title' => 'Walk This Land', 'genre' => 'Drum \'n\' Bass', 'quantity' => 5, 'artist_id' => artist1.id })
album2 = Album.new({'title' => 'The Nine', 'genre' => 'Drum \'n\' Bass', 'quantity' => 3, 'artist_id' => artist2.id })
album1.save
album2.save
# default_settings = Stock.new({'low' => 1, 'medium' => 2, 'high' => 3})
# default_settings.save

binding.pry
nil
