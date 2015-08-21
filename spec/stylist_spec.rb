require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("starts off with no stylist") do
      expect(Stylist.all()).to(eq([]))
    end
  end
end
