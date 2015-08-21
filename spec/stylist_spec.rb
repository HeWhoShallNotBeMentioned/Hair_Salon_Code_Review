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
