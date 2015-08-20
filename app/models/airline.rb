class Airline < ActiveRecord::Base
    validates_presence_of :name 
      
    def self.active_objects
        self
    end
    
    
    def self.create_object(params)
        params[:name] = params[:name].upcase if params[:name].present?
        params[:abbrevation] = params[:abbrevation].upcase if params[:abbrevation].present?
        new_object = self.new
        new_object.name = params[:name]
        new_object.abbrevation = params[:abbrevation]
        if new_object.save
        end
        return new_object
    end
    
    def update_object(params)
        params[:name] = params[:name].upcase if params[:name].present?
        params[:abbrevation] = params[:abbrevation].upcase if params[:abbrevation].present?
        self.name = params[:name]
        self.abbrevation = params[:abbrevation]
        if self.save
        end
        return self
    end
    
    def delete_object
        self.destroy
        return self
    end
        
end
