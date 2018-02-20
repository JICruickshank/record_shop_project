require_relative("../models/artists.rb")
require_relative("../models/albums.rb")
require_relative("../models/sales.rb")

require("pry-byebug")

Artist.delete_all
Album.delete_all
Sale.delete_all

artist1 = Artist.new({'name' => 'E-Z Rollers'})
artist2 = Artist.new({'name' => 'Bad Company UK'})
artist1.save
artist2.save
album1 = Album.new({'title' => 'Walk This Land', 'genre' => 'Drum \'n\' Bass', 'quantity' => 5, 'artist_id' => artist1.id, 'buy_price' => 10, 'sale_price' => 20})
album2 = Album.new({'title' => 'The Nine', 'genre' => 'Drum \'n\' Bass', 'quantity' => 3, 'artist_id' => artist2.id, 'buy_price' => 20, 'sale_price' => 30})
album1.save
album2.save
# sale1 = Sale.new({'album_id' => album1.id, 'sale_quantity' => 1, 'sale_date' => "20/02/2018"})
# sale1.save


binding.pry
nil
