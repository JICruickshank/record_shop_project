require_relative("../models/albums.rb" )
require_relative("../models/artists.rb")
require_relative("../models/sales.rb")

get "/inventory" do
  @albums = Album.all
  erb(:"inventory/index")
end

post "/inventory/:id/delete" do
  album_id = params[:id].to_i
  @album = Album.find_by_id(album_id)
  @album.delete
  erb(:"inventory/delete")
end

get "/inventory/:id" do
  album_id = params[:id].to_i
  @album = Album.find_by_id(album_id)
  erb(:"inventory/show")
end

get "/inventory/:id/edit" do
  album_id = params[:id].to_i
  @album = Album.find_by_id(album_id)
  erb(:"inventory/edit")
end

post "/inventory/:id" do
  if Artist.find_id_by_name(params[:name]) == false
    @artist = Artist.new(params)
    @artist.save
    params[:artist_id] = @artist.id
    @album = Album.new(params)
    @album.update
  else
    artist_id = Artist.find_id_by_name(params[:name])
    params[:artist_id] = artist_id
    @album = Album.new(params)
    @album.update
  end
erb(:"inventory/update")
end

get "/inventory/:id/sell" do
  @album = Album.find_by_id(params[:id])
  erb(:"inventory/sell")
end

post "/inventory/:id/confirmation_of_sale"  do
  album = Album.find_by_id(params[:id])
  params[:artist_id] = params[:id]
  sale = Sale.new(params)
  @result = album.sell(sale)
  erb(:"inventory/confirmation")
end
