require("sinatra")
require("sinatra/reloader")
require("./lib/client")
require("./lib/stylist")
also_reload("lib/**/*.rb")
require('pg')
require('pry')


DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  erb(:index)
end

# get("/public") do
#   erb(:public)
# end
#
# post("/public") do
#   erb(:public)
# end

get("/stylists") do
  @stylists = Stylist.all()
  erb(:stylists)
end

get("/stylists/stylist/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())

  erb(:stylist)
end


patch('/stylists/stylist/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  stylist_name = params.fetch("stylist_name")

  @stylist.update({:stylist_name => stylist_name})
  erb(:stylist)
end

post("/stylists") do
  stylist_name = params.fetch("stylist_name")
  @stylist = Stylist.new({:stylist_name => stylist_name, :stylist_id => nil })
  @stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end


delete('/stylists/stylist/:stylist_id') do
  @stylist = Stylist.find(params.fetch('stylist_id').to_i)
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylists)
end
