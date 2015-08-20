require 'spec_helper'

describe Continent do
  before (:each) do
  @name_1 = "Name_01"
  @name_2 = "Name_02"
  @abbrevation_1 = "Abv_01"
  @abbrevation_2 = "Abv_02"
  end
  
  it "should not create object without name" do
    continent = Continent.create_object(
      :name => nil ,
      :abbrevation => @abbrevation_1,
      )
    continent.errors.size.should_not == 0
  end
    
  context "create new Continent" do
    before (:each) do
      @continent = Continent.create_object(
        :name => @name_1 ,
        :abbrevation => @abbrevation_1,
        )
    end
    
    it "should create Continent" do
      @continent.errors.size.should == 0
      @continent.should be_valid
    end
    
    it "should update Continent" do
      @continent.update_object(
        :name => @name_2,
        :abbrevation => @abbrevation_2,
        )
      @continent.errors.size.should == 0
      @continent.name.should == @name_2.upcase
      @continent.abbrevation.should == @abbrevation_2.upcase
    end
    
    it "should not update Continent if name not valid" do
      @continent.update_object(
        :name => nil,
        :abbrevation => @abbrevation_2,
        )
      @continent.errors.size.should_not == 0
    end
    
    it "should delete Continent" do
      @continent.delete_object
      @continent.errors.size.should == 0
    end
  end
    
end
