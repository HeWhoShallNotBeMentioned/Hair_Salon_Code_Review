require('spec_helper')

describe(Client) do
  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a client to the array of saved clients") do
      test_client = Client.new({:client_name => "Melanie Hetrick", :client_id => 1, :stylist_id => 1 })
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe("#client_name") do
    it("lets you enter a client name") do
      test_client = Client.new({:client_name => "Melanie Hetrick", :client_id => 1, :stylist_id => 1})
      expect(test_client.client_name()).to(eq("Melanie Hetrick"))
    end
  end

  describe("#stylist_id") do
    it("lets you enter a stylist_id") do
      test_client = Client.new({:client_name => "Melanie Hetrick", :client_id => 1, :stylist_id => 7})
      expect(test_client.stylist_id()).to(eq(7))
    end
  end

  describe("#==") do
  it("is the same client if it has the same name") do
    client1 = Client.new({:client_name => "Melanie Hetrick", :client_id => 1, :stylist_id => 24})
    client2 = Client.new({:client_name => "Melanie Hetrick", :client_id => 1, :stylist_id => 24})
    expect(client1).to(eq(client2))
  end
  end


end
