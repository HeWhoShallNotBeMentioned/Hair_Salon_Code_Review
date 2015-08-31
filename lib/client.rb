class Client

  attr_reader(:client_name, :client_id, :stylist_id)

  define_method(:initialize) do |attributes|
    @client_name = attributes.fetch(:client_name)
    @client_id = attributes.fetch(:client_id, nil)
    @stylist_id = attributes.fetch(:stylist_id, nil)
  end

  define_singleton_method(:all) do
      returned_clients = DB.exec("Select * FROM clients;")
      clients = []
      returned_clients.each() do |client|
        client_name = client.fetch("client_name")
        client_id = client.fetch("client_id").to_i()
        stylist_id = client.fetch("stylist_id").to_i()
        clients.push(Client.new({:client_name => client_name, :client_id => client_id, :stylist_id => stylist_id}))
      end
      clients
    end

    define_method(:save) do
      result = DB.exec("INSERT INTO clients (client_name) VALUES ('#{@client_name}') RETURNING client_id;")
      @client_id = result.first().fetch("client_id").to_i()
    end

    define_method(:update) do |attributes|
    @client_name = attributes.fetch(:client_name)
    @stylist_id = attributes.fetch(:stylist_id)
    @client_id = self.client_id()
    DB.exec("UPDATE clients SET client_name = '#{@client_name}', stylist_id = #{@stylist_id} WHERE client_id = #{client_id};")
  end

  define_method(:delete) do
        DB.exec("DELETE FROM clients WHERE client_id = #{self.client_id()};")
      end





    define_method(:==) do |another_client|
        self.client_name().==(another_client.client_name()).&(self.stylist_id().==(another_client.stylist_id()))
      end


end
