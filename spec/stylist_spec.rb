require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("starts off with no stylist") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#stylist_name") do
    it("tells you stylist name") do
      stylist = Stylist.new({:stylist_name => "Vidal Sasson", :stylist_id => nil})
      expect(stylist.stylist_name()).to(eq("Vidal Sasson"))
    end
  end

describe("#save") do
    it("lets you save stylists to the database") do
      stylist = Stylist.new({:stylist_name => "Beeker", :stylist_id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name and stylist id") do
      stylist1 = Stylist.new({:stylist_name => "Swedish Chef", :stylist_id => nil})
      stylist2 = Stylist.new({:stylist_name => "Swedish Chef", :stylist_id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe('.find') do
    it('returns a stylist by its id') do
      test_stylist = Stylist.new({:stylist_name => "Homer Simpson", :stylist_id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:stylist_name => "Bart Simpson", :stylist_id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.stylist_id())).to(eq(test_stylist2))
    end
  end

  describe("#clients") do
      it('returns an array of client for that stylist') do
        test_stylist = Stylist.new({:stylist_name => "Hannibal Lecter", :stylist_id => nil })
        test_stylist.save()
        test_client = Client.new({:client_name => "Will Graham", :client_id => 4, :stylist_id => test_stylist.stylist_id() })
        test_client.save()
        test_client2 = Client.new({:client_name => "Clarice Starling", :client_id => 15, :stylist_id => test_stylist.stylist_id() })
        test_client2.save()
        expect(test_stylist.clients()).to(eq([test_client, test_client2]))
      end
    end


end
