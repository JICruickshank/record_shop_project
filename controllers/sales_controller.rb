get "/sales" do
  @sales = Sale.all
  erb(:"sales/index")

end
