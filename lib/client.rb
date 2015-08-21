class Client

  attr_reader(:client_name, :client_id)

  define_method(:initialize) do |attributes|
    @client_name = attributes.fetch(:client_name)
    @list_id = attributes.fetch(:list_id)
  end

  define_singleton_method(:all) do
      returned_clients = DB.exec("Select * FROM clients;")
      clients = []
      returned_clients.each() do |client|
        client_name = client.fetch("client_name")
        client_id = client.fetch("client_id").to_i()
        clients.push(Client.new({:client_name => client_name, :client_id => client_id}))
      end
      clients
    end
end
