require('spec_helper')

describe(Client) do
  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
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

  # describe("#save") do
  #   it("adds a client to the array of saved arrays") do
  #     test_client = Client.new({:description => "write new spec", :list_id => 1, :due_date => "2015-02-14 00:00:00"})
  #     test_task.save()
  #     expect(Todo.all()).to(eq([test_task]))
  #   end
  # end

end
