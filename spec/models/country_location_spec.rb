require 'spec_helper'

describe CountryLocation do
  before (:each) do
  @name_1 = "Name_01"
  @name_2 = "Name_02"
  @abbrevation_1 = "Abv_01"
  @abbrevation_2 = "Abv_02"
  @continent_1 = Continent.create_object(
        :name => "Continent_01" ,
        :abbrevation => "CMN1",
        )
  @continent_2 = Continent.create_object(
      :name => "Continent_02" ,
      :abbrevation => "CMN2",
      )
  
  end
  
  it "should not create object without name" do
    country = CountryLocation.create_object(
      :name => nil ,
      :abbrevation => @abbrevation_1,
      :continent_id => @continent_1.id
      )
    country.errors.size.should_not == 0
  end
  
  it "should not create object if continent not valid" do
    country = CountryLocation.create_object(
      :name => @name_1 ,
      :abbrevation => @abbrevation_1,
      :continent_id => 2312
      )
    country.errors.size.should_not == 0
  end
  
  context "create new CountryLocation" do
    before (:each) do
      @country = CountryLocation.create_object(
        :name => @name_1 ,
        :abbrevation => @abbrevation_1,
        :continent_id => @continent_1.id
        )
    end
    
    it "should create CountryLocation" do
      @country.errors.size.should == 0
      @country.should be_valid
    end
    
    it "should update CountryLocation" do
      @country.update_object(
        :name => @name_2,
        :abbrevation => @abbrevation_2,
        :continent_id => @continent_2.id
        )
      @country.errors.size.should == 0
      @country.name.should == @name_2.upcase
      @country.abbrevation.should == @abbrevation_2.upcase
      @country.continent_id.should == @continent_2.id
    end
    
    it "should not update CountryLocation if name not valid" do
      @country.update_object(
        :name => nil,
        :abbrevation => @abbrevation_2,
        :continent_id => @continent_2.id
        )
      @country.errors.size.should_not == 0
    end
    
    it "should delete CountryLocation" do
      @country.delete_object
      @country.errors.size.should == 0
    end
  end
end
