require 'spec_helper'

describe CityLocation do
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
    @country_2 = CountryLocation.create_object(
      :name => "Country_02" ,
      :abbrevation => "CNT2",
      :continent_id => @continent_1.id
      )
  end
    
    it "should not create object without name" do
      city = CityLocation.create_object(
        :name => nil ,
        :abbrevation => @abbrevation_1,
        :country_location_id => @country_1.id
        )
      city.errors.size.should_not == 0
    end
    
    it "should not create object if continent not valid" do
      city = CityLocation.create_object(
        :name => @name_1 ,
        :abbrevation => @abbrevation_1,
        :country_location_id => 2312
        )
      city.errors.size.should_not == 0
    end
    
    context "create new CityLocation" do
      before (:each) do
        @city = CityLocation.create_object(
          :name => @name_1 ,
          :abbrevation => @abbrevation_1,
          :country_location_id =>@country_1.id
          )
      end
      
      it "should create CityLocation" do
        @city.errors.size.should == 0
        @city.should be_valid
        
      end
      
      it "should update CityLocation" do
        @city.update_object(
          :name => @name_2,
          :abbrevation => @abbrevation_2,
          :country_location_id =>@country_2.id
          )
        @city.errors.size.should == 0
        @city.name.should == @name_2.upcase
        @city.abbrevation.should == @abbrevation_2.upcase
        @city.country_location_id.should == @country_2.id
      end
      
      it "should not update CityLocation if name not valid" do
        @city.update_object(
          :name => nil,
          :abbrevation => @abbrevation_2,
          :country_location_id =>@country_2.id
          )
        @city.errors.size.should_not == 0
      end
      
      it "should delete CityLocation" do
        @city.delete_object
        @city.errors.size.should == 0
      end
  end
    
end
