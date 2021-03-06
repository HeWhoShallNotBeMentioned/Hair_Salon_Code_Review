require("sinatra")
require("sinatra/reloader")
require("./lib/client")
require("./lib/stylist")
also_reload("lib/**/*.rb")
require('pg')
require('pry')


DB = PG.connect({:dbname => "hair_salon_test"})

get("/") do
  erb(:index)
end

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

get("/clients") do
  @clients = Client.all()
  erb(:clients)
end

get("/clients/client/:id") do
  @client = Client.find(params.fetch("id").to_i())
  @stylists = Stylist.all()
  erb(:client)
end

patch('/clients/client/:id') do
  @client = Client.find(params.fetch('id').to_i)
  client_name = params.fetch("client_name")

  @client.update({:client_name => client_name})
  erb(:client)
end

post("/clients") do
  client_name = params.fetch("client_name")
  @client = Client.new({:client_name => client_name, :client_id => nil, :stylist_id => nil })
  @client.save()
  @clients = Client.all()
  erb(:clients)
end

delete('/clients/client/:client_id') do
  @client = Client.find(params.fetch('client_id').to_i)
  @client.delete()
  @clients = Client.all()
  erb(:clients)
end

patch('/clients/client/:id/add_stylist') do
  @client = Client.find(params.fetch('id').to_i())
  stylist_id = params.fetch('stylist_id').to_i()
  @client.update({:stylist_id => stylist_id})
  redirect('/clients/client/' + @client.client_id().to_s())
end

patch('/clients/client/:id/remove_stylist') do
  @client = Client.find(params.fetch('id').to_i())
  @client.remove_stylist()
  redirect('/clients/client/' + @client.client_id().to_s())
end
