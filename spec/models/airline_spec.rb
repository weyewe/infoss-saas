require 'spec_helper'

describe Airline do
    before (:each) do
        @name_1 = "air canada"
        @name_2 = "air china"
        @abbrevation_1= "ac"
        @abbrevation_2 = "ca"
    end
    
    it "should not create Airline if name is not valid" do
        airline = Airline.create_object(
            :name => nil,
            :abbrevation => @abbrevation_1
            )
        airline.errors.size.should_not == 0      
        airline.should_not be_valid
    end
    
    context "Create Airline" do
        before (:each) do
        @airline = Airline.create_object(
            :name => @name_1,
            :abbrevation => @abbrevation_1
            )
        end
        
        it "should Create Airline" do
            @airline.errors.size.should == 0
            @airline.should be_valid
        end
        
        it "should not Update Airline if name is not valid" do
            @airline.update_object(
                :name => nil,
                :abbrevation => @abbrevation_1
                )
            @airline.errors.size.should_not == 0
            @airline.should_not be_valid
        end
        it "should Update Airline" do
            @airline.update_object(
                :name => @name_2,
                :abbrevation => @abbrevation_2
                )
            @airline.errors.size.should == 0
            @airline.name.should == @name_2.upcase
            @airline.abbrevation.should == @abbrevation_2.upcase
        end
        
        it "should Delete Airline" do
            @airline.delete_object
            @airline.errors.size.should == 0
        end
    end
    
end
