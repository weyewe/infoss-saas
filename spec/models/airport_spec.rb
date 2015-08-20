require 'spec_helper'

describe Airport do
  before (:each) do
    @name_1 = "Name_01"
    @name_2 = "Name_02"
    @abbrevation_1 = "Abv_01"
    @abbrevation_2 = "Abv_02"
    @continent_1 = Continent.create_object(
      :name => "Continent_01" ,
      :abbrevation => "CMN1",
      )
    @country_1 = CountryLocation.create_object(
      :name => "Country_01" ,
      :abbrevation => "CNT2",
      :continent_id => @continent_1.id
      )
    @city_1 = CityLocation.create_object(
      :name => "City_01" ,
      :abbrevation => "CTY1",
      :country_location_id => @country_1.id
      )
    @city_2 = CityLocation.create_object(
      :name => "City_02" ,
      :abbrevation => "CTY2",
      :country_location_id => @country_1.id
      )
  end
    
    it "should not create object without name" do
      airport = Airport.create_object(
        :name => nil ,
        :abbrevation => @abbrevation_1,
        :city_location_id => @city_1.id
        )
      airport.errors.size.should_not == 0
    end
    
    it "should not create object if city_location not valid" do
      airport = Airport.create_object(
        :name => @name_1 ,
        :abbrevation => @abbrevation_1,
        :city_location_id => 2312
        )
      airport.errors.size.should_not == 0
    end
    
    context "create new Airport" do
      before (:each) do
        @airport = Airport.create_object(
          :name => @name_1 ,
          :abbrevation => @abbrevation_1,
          :city_location_id =>@city_1.id
          )
      end
      
      it "should create Airport" do
        @airport.errors.size.should == 0
        @airport.should be_valid
        
      end
      
      it "should update Airport" do
        @airport.update_object(
          :name => @name_2,
          :abbrevation => @abbrevation_2,
          :city_location_id =>@city_2.id
          )
        @airport.errors.size.should == 0
        @airport.name.should == @name_2.upcase
        @airport.abbrevation.should == @abbrevation_2.upcase
        @airport.city_location_id.should == @city_2.id
      end
      
      it "should not update Airport if name not valid" do
        @airport.update_object(
          :name => nil,
          :abbrevation => @abbrevation_2,
          :city_location_id =>@city_2.id
          )
        @airport.errors.size.should_not == 0
      end
      
      it "should delete Airport" do
        @airport.delete_object
        @airport.errors.size.should == 0
      end
  end
end
