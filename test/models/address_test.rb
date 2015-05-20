require "test_helper"

describe Address do
  describe "#short_format" do
    it "should be city, state, country for United States address" do
      a = Address.new locality: "Chunky", region: "MS", country_code_alpha2: "US"

      a.short_format.must_equal "Chunky, MS, US"
    end

    it "should be city, state, country for a foreign address with a state" do
      a = Address.new locality: "Montreal", region: "QC", country_code_alpha2: "Canada"

      a.short_format.must_equal "Montreal, QC, Canada"
    end

    it "should be city, country for a foreign address with no state" do
      a = Address.new locality: "Abidjan", country_code_alpha2: "Côte d'Ivoire"

      a.short_format.must_equal "Abidjan, Côte d'Ivoire"
    end

    it "should be city, country for a foreign address with a US state abbreviation" do
      a = Address.new locality: "Abidjan", region: "AL", country_code_alpha2: "Côte d'Ivoire"

      a.short_format.must_equal "Abidjan, Côte d'Ivoire"
    end    
  end
end
