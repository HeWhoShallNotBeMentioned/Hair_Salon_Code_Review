class Stylist
  attr_reader(:stylist_name, :stylist_id)

    define_method(:initialize) do |attributes|
      @stylist_name = attributes.fetch(:stylist_name)
      @stylist_id = attributes.fetch(:stylist_id)
    end

    define_singleton_method(:all) do
      returned_stylists = DB.exec("Select * FROM stylists;")
      stylists = []
      returned_stylists.each() do |stylist|
        stylist_name = stylist.fetch("stylist_name")
        stylist_id = stylist.fetch("stylist_id").to_i()
        stylists.push(Stylist.new({:stylist_name => stylist_name, :stylist_id => stylist_id}))
      end
      stylists
    end

    define_method(:save) do
    result = DB.exec("INSERT INTO stylists (stylist_name) VALUES ('#{@stylist_name}') RETURNING stylist_id;")
    @stylist_id = result.first().fetch("stylist_id").to_i()
  end

  define_method(:==) do |another_stylist|
    self.stylist_name().==(another_stylist.stylist_name()).&(self.stylist_id().==(another_stylist.stylist_id()))
  end

  define_singleton_method(:find) do |stylist_id|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.stylist_id().==(stylist_id)
        found_stylist = stylist
      end
    end
    found_stylist
  end


  define_method(:update) do |attributes|
  @stylist_name = attributes.fetch(:stylist_name)

  DB.exec("UPDATE stylists SET stylist_name = '#{@stylist_name}' WHERE stylist_id = #{@stylist_id};")
end

define_method(:delete) do
      DB.exec("DELETE FROM stylists WHERE stylist_id = #{self.stylist_id()};")
    end


  define_method(:clients) do
    my_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.stylist_id()};")
    clients.each() do |client|
      client_name = client.fetch("client_name")
      client_id = client.fetch("client_id").to_i()
      stylist_id = client.fetch("stylist_id").to_i()
      my_clients.push(Client.new({:client_name => client_name, :client_id => client_id, :stylist_id => stylist_id}))
    end
     my_clients
  end


end
