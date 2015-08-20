require 'spec_helper'

describe Vessel do
  before (:each) do
        @name_1 = "vessel1"
        @name_2 = "vessel2"
        @abbrevation_1= "vs1"
        @abbrevation_2 = "vs2"
    end
    
    it "should not create Vessel if name is not valid" do
        vessel = Vessel.create_object(
            :name => nil,
            :abbrevation => @abbrevation_1
            )
        vessel.errors.size.should_not == 0      
        vessel.should_not be_valid
    end
    
    context "Create Vessel" do
        before (:each) do
        @vessel = Vessel.create_object(
            :name => @name_1,
            :abbrevation => @abbrevation_1
            )
        end
        
        it "should Create Vessel" do
            @vessel.errors.size.should == 0
            @vessel.should be_valid
        end
        
        it "should not Update Vessel if name is not valid" do
            @vessel.update_object(
                :name => nil,
                :abbrevation => @abbrevation_1
                )
            @vessel.errors.size.should_not == 0
            @vessel.should_not be_valid
        end
        it "should Update Vessel" do
            @vessel.update_object(
                :name => @name_2,
                :abbrevation => @abbrevation_2
                )
            @vessel.errors.size.should == 0
            @vessel.name.should == @name_2.upcase
            @vessel.abbrevation.should == @abbrevation_2.upcase
        end
        
        it "should Delete Vessel" do
            @vessel.delete_object
            @vessel.errors.size.should == 0
        end
    end  
    
end
