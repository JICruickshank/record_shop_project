require_relative("../models/artists.rb")
require_relative("../models/albums.rb")
require_relative("../models/sales.rb")

require("pry-byebug")

Artist.delete_all
Album.delete_all
Sale.delete_all

artist1 = Artist.new({'name' => 'E-Z Rollers'})
artist2 = Artist.new({'name' => 'Bad Company UK'})
artist3 = Artist.new({'name' => 'The Stone Roses'})
artist4 = Artist.new({'name' => 'The Happy Mondays'})

artist1.save
artist2.save
artist3.save
artist4.save

album1 = Album.new({'title' => 'Walk This Land', 'genre' => 'Drum \'n\' Bass', 'quantity' => 5, 'artist_id' => artist1.id, 'buy_price' => 10, 'sale_price' => 20})
album2 = Album.new({'title' => 'The Nine', 'genre' => 'Drum \'n\' Bass', 'quantity' => 3, 'artist_id' => artist2.id, 'buy_price' => 20, 'sale_price' => 30})
album3 = Album.new({'title' => 'The Fear EP', 'genre' => 'Drum \'n\' Bass', 'quantity' => 2, 'artist_id' => artist2.id, 'buy_price' => 10, 'sale_price' => 20})
album4 = Album.new({'title' => 'The Stone Roses', 'genre' => 'Indie', 'quantity' => 5, 'artist_id' => artist3.id, 'buy_price' => 5, 'sale_price' => 20})
album5 = Album.new({'title' => 'Pills, Thrills and Bellyaches', 'genre' => 'Indie', 'quantity' => 3, 'artist_id' => artist4.id, 'buy_price' => 10, 'sale_price' => 30})

album1.save
album2.save
album3.save
album4.save
album5.save

sale1 = Sale.new({'album_id' => album2.id, 'sale_quantity' => 1, 'sale_date' => "20/02/2018"})
sale1.save
sale2 = Sale.new({'album_id' => album2.id, 'sale_quantity' => 1, 'sale_date' => "20/02/2018"})
sale2.save
sale3 = Sale.new({'album_id' => album3.id, 'sale_quantity' => 1, 'sale_date' => "20/02/2018"})
sale3.save
sale4 = Sale.new({'album_id' => album4.id, 'sale_quantity' => 2, 'sale_date' => "21/02/2018"})
sale4.save
sale5 = Sale.new({'album_id' => album5.id, 'sale_quantity' => 1, 'sale_date' => "22/02/2018"})
sale5.save




binding.pry
nil
