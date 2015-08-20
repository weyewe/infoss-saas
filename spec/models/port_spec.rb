require 'spec_helper'

describe Port do
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
      port = Port.create_object(
        :name => nil ,
        :abbrevation => @abbrevation_1,
        :city_location_id => @city_1.id
        )
      port.errors.size.should_not == 0
    end
    
    it "should not create object if city_location not valid" do
      port = Port.create_object(
        :name => @name_1 ,
        :abbrevation => @abbrevation_1,
        :city_location_id => 2312
        )
      port.errors.size.should_not == 0
    end
    
    context "create new Port" do
      before (:each) do
        @port = Port.create_object(
          :name => @name_1 ,
          :abbrevation => @abbrevation_1,
          :city_location_id =>@city_1.id
          )
      end
      
      it "should create Port" do
        @port.errors.size.should == 0
        @port.should be_valid
        
      end
      
      it "should update Port" do
        @port.update_object(
          :name => @name_2,
          :abbrevation => @abbrevation_2,
          :city_location_id =>@city_2.id
          )
        @port.errors.size.should == 0
        @port.name.should == @name_2.upcase
        @port.abbrevation.should == @abbrevation_2.upcase
        @port.city_location_id.should == @city_2.id
      end
      
      it "should not update Port if name not valid" do
        @port.update_object(
          :name => nil,
          :abbrevation => @abbrevation_2,
          :city_location_id =>@city_2.id
          )
        @port.errors.size.should_not == 0
      end
      
      it "should not update object if city_location not valid" do
        @port.update_object(
        :name => @name_2 ,
        :abbrevation => @abbrevation_2,
        :city_location_id => 2312
        )
      port.errors.size.should_not == 0
    end
    
      
      it "should delete Port" do
        @port.delete_object
        @port.errors.size.should == 0
      end
  end  
    
    
end
