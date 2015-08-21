require("sinatra")
require("sinatra/reloader")
require("./lib/stylist")
require("./lib/client")
also_reload("lib/**/*.rb")
require('pg')


DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  erb(:index)
end

# get("/stylists/new")
#   erb(:stylist_form)
# end
