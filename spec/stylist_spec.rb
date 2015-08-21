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
